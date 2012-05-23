class AddActiveToStartups < ActiveRecord::Migration
  def self.up
    add_column :startups, :active, :boolean, :default => false
  end

  def self.down
    remove_column :startups, :active
  end
end
