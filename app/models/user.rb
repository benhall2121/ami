class User < ActiveRecord::Base
  has_many :startups
  has_many :transactions

  before_create { generate_token(:auth_token) }

  attr_accessible :email, :password, :password_confirmation, :user_type, :photo, :stripe_customer_token
  
  attr_accessor :password, :stripe_card_token
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  has_attached_file :photo, :styles => { :tiny => "50x50>", :small => "150x150>", :medium => "300x300>", :large => "450x450>" },
    :url  => "/assets/user/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/user/:id/:style/:basename.:extension",
    :default_url => "/images/default_user/:style/default.jpg"

  validates_attachment_size :photo, :less_than => 10.megabytes

  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/pjpeg', 'image/x-png']

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    AmiMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.base64.tr("+/", "-_")
    end while User.exists?(column => self[column])
  end

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(:description => email, :card => stripe_card_token)
      self.stripe_customer_token = customer.id
      self.last_four_cc = customer.active_card.last4 
      save!
    end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      return false
  end

end
