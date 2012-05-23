class CreateDescriptions < ActiveRecord::Migration
  def self.up
    create_table :descriptions do |t|
      t.string :title
      t.string :type
      t.text :desc
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :descriptions
  end
end
