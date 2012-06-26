class AddDonationAmountToStartup < ActiveRecord::Migration
  def self.up
    add_column :startups, :donation_amount, :integer, :default => 0
  end

  def self.down
    remove_column :startups, :donation_amount
  end
end
