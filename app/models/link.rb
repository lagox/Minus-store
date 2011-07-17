class Link < ActiveRecord::Base
  
  #validates
  validates :title, :url, :presence => true
  
  #sort
  default_scope order("id DESC")
  
  #paginate
  cattr_reader :per_page
  @@per_page = 10                      
end
