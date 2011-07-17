#encoding:utf-8
class Post < ActiveRecord::Base
  
  #CATEGORY
  CATEGORY = ["Новости", "Акции"]
  
  #validates
  validates :title, :body, :category, :presence => true
  validates :category, :inclusion => CATEGORY
  #sort
  default_scope order("id DESC")
  
  #paginate
  cattr_reader :per_page
  @@per_page = 5
end
