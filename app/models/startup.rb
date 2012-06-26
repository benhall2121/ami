class Startup < ActiveRecord::Base
  belongs_to :user
  has_many :descriptions
  has_many :transactions


  validates_presence_of :startup_name, :message => "Startup Name cannot be blank."
  validates :startup_logo_file_name, :presence => { :message => "Logo is required." }

  accepts_nested_attributes_for :descriptions, :reject_if => lambda { |a| a[:title].blank? && a[:desc].blank? && a[:desc_type].blank? }, :allow_destroy => true

  has_attached_file :startup_logo, :whiny => false, :styles => { :icon => ["64x64#"], :secondIcon => ["75x75>"], :small => ["128x128>"], :medium => ["300x300>"], :large => ["1224x1584>"] }, #:styles      => {:icon => "50x50#", :thumb=> "100x100#", :small  => "190x190#", :large => "500x500>" },
  :url  => "/assets/startup_logo/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/startup_logo/:id/:style/:basename.:extension",
  :convert_options => { :large => '-quality 100' }

  #validates_attachment_size :startup_logo, :less_than => 10.megabytes
  #validates_attachment_content_type :attached, :content_type => ['image/jpeg', 'image/png', 'application/pdf', 'application/octet-stream', 'application/msword']

  def self.search(search)
    if search
      where('startup_name LIKE ? OR brief_description LIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end 
  end

end
