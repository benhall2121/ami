class AddStartupIdToDescriptions < ActiveRecord::Migration
  def self.up
    add_column :descriptions, :startup_id, :integer
  end

  def self.down
    remove_column :descriptions, :startup_id
  end
end
