class Catalog < ActiveRecord::Base
  validates :title, :file, :length, :price, :presence => true
  validates :length, :price, :numericality => true

end
