class AddVideoCodeToDescriptions < ActiveRecord::Migration
  def self.up
    add_column :descriptions, :video_code, :string
  end

  def self.down
    remove_column :descriptions, :video_code
  end
end
