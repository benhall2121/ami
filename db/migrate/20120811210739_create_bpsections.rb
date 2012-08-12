class CreateBpsections < ActiveRecord::Migration
  def self.up
    create_table :bpsections do |t|
      t.string :title
      t.integer :startup_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bpsections
  end
end
