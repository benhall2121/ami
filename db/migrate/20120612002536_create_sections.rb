class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string :page_type
      t.string :page_title
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
