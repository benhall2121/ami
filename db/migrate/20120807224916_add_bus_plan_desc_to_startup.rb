class AddBusPlanDescToStartup < ActiveRecord::Migration
  def self.up
    add_column :startups, :busplandesc, :text
  end

  def self.down
    remove_column :startups, :busplandesc
  end
end
