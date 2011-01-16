class Post < ActiveRecord::Base
  #validates
  validates :title, :body, :category, :presence => true
  
end
