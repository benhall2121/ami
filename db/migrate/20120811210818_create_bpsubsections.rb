class CreateBpsubsections < ActiveRecord::Migration
  def self.up
    create_table :bpsubsections do |t|
      t.string :title
      t.text :description
      t.integer :bpsection_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bpsubsections
  end
end
