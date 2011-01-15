#encoding:utf-8
module ApplicationHelper
  
  def title
    @base_title = "Minus-store"
    if @title.nil?
      @base_title
    else
      @base_title + " | " + @title
    end
  end
  
  def domain
    @domain = request.host_with_port
  end
  
  def new_minus
    @lastminus = Catalog.last(5)
  end
  
  def sold_minus
    @soldminus = Catalog.where(:sold => true).last(5)
  end
  
end
