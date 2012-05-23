class RenameTypeColumnInDescriptionsTable < ActiveRecord::Migration
  def self.up
  	rename_column :descriptions, :type, :desc_type
  end

  def self.down
  	rename_column :descriptions, :desc_type, :type
  end
end
