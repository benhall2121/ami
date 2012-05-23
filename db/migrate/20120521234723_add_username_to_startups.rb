class AddUsernameToStartups < ActiveRecord::Migration
  def self.up
    add_column :startups, :username, :string
  end

  def self.down
    remove_column :startups, :username
  end
end
