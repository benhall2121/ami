class AddStripeChargeIdToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :charge_id, :string
  end

  def self.down
    remove_column :transactions, :charge_id
  end
end
