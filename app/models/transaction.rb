class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :startup

  def save_and_make_charge
  
  	puts ''
  	puts 'save_and_make_charge'
  	puts 'amount'
  	puts self.amount.to_f*100
  	puts 'token'
  	puts self.user.stripe_customer_token
  	puts 'user email'
  	puts self.user.email
    puts 'startup name'
    puts self.startup.startup_name
    puts 'get_stripe_customer_id(user)'


    if valid?
    charge = Stripe::Charge.create(
      :amount => (self.amount.to_f*100).to_i, # amount in cents, again
      :currency => "usd",
      :customer => self.user.stripe_customer_token,
      :description => "Paymount from user: " + self.user.email + " (user_id:" + self.user.id.to_s + " )" + " to startup: " + self.startup.startup_name + " (startup_id: " + self.startup.id.to_s + ")"
    )

    puts 'charge id'
    puts charge.id

    self.charge_id = charge.id
    save!
	end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
  end

end
