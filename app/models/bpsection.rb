class Bpsection < ActiveRecord::Base
  belongs_to :startup
  has_many :bpsubsections, :dependent => :destroy

  accepts_nested_attributes_for :bpsubsections, :reject_if => lambda { |a| a[:title].blank? && a[:description].blank? }, :allow_destroy => true
end
