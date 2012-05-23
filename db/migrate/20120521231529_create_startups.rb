class CreateStartups < ActiveRecord::Migration
  def self.up
    create_table :startups do |t|
      t.integer :user_id
      t.string :startup_name
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :brief_description

      t.timestamps
    end
  end

  def self.down
    drop_table :startups
  end
end
