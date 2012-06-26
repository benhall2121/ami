class AddLastFourCcToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :last_four_cc, :string
  end

  def self.down
    remove_column :users, :last_four_cc
  end
end
