#encoding:UTF-8
class Catalog < ActiveRecord::Base
  
  #paperclip minus
  has_attached_file :minus,
                    :url => ":attachment/:id/:basename.:extension",
                    :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  validates_attachment_presence :minus
  validates_attachment_content_type :minus, :content_type => ['audio/mp3', 'audio/mpeg', 'audio/x-mp3']
  
  #paperclip archive
  has_attached_file :archive,
                    :url => ":attachment/:id/:basename.:extension",
                    :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  validates_attachment_presence :archive
  validates_attachment_content_type :archive, :content_type => ['application/zip', 'application/x-zip-compressed', 'x-rar-compressed'] 
  
  #sort
  default_scope order("id DESC")
  
  #validates
  validates :title, :length, :price, :presence => true
  validates :length, :price, :numericality => true
  
  #paginate
  cattr_reader :per_page
  @@per_page = 5
  
end
