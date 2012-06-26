class AddStripeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :stripe_customer_token, :string
  end

  def self.down
    remove_column :users, :stripe_customer_token
  end
end
