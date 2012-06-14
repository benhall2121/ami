class Description < ActiveRecord::Base
  belongs_to :startup

  has_attached_file :upload_content, :whiny => false, :styles => { :icon => ["63x63>"], :small => ["128x128>"], :medium => ["300x300>"], :medium640 => ["640>x480"], :large => ["1224x1584>"] }, #:styles      => {:icon => "50x50#", :thumb=> "100x100#", :small  => "190x190#", :large => "500x500>" },
  :url  => "/assets/upload_content/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/upload_content/:id/:style/:basename.:extension",
  :convert_options => { :large => '-quality 100' }

  #validates_attachment_size :upload_content, :less_than => 10.megabytes
  #validates_attachment_content_type :attached, :content_type => ['image/jpeg', 'image/png', 'application/pdf', 'application/octet-stream', 'application/msword']

end
