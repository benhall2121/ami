class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.string :amount
      t.string :transaction_type
      t.integer :user_id
      t.integer :startup_id

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
