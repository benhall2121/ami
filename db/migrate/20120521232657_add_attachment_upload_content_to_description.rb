class AddAttachmentUploadContentToDescription < ActiveRecord::Migration
  def self.up
    add_column :descriptions, :upload_content_file_name, :string
    add_column :descriptions, :upload_content_content_type, :string
    add_column :descriptions, :upload_content_file_size, :integer
    add_column :descriptions, :upload_content_updated_at, :datetime
  end

  def self.down
    remove_column :descriptions, :upload_content_file_name
    remove_column :descriptions, :upload_content_content_type
    remove_column :descriptions, :upload_content_file_size
    remove_column :descriptions, :upload_content_updated_at
  end
end
