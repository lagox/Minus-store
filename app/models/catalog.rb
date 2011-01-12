#encoding:UTF-8
class Catalog < ActiveRecord::Base
  default_scope order("id DESC")  # sort
  validates :title, :file, :length, :price, :presence => true
  validates :length, :price, :numericality => true
  
  #paginate
  cattr_reader :per_page
  @@per_page = 5

end
