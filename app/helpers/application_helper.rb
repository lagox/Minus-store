#encoding:utf-8
module ApplicationHelper
  
  def title
    @base_title = "TheMinus.ru"
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
    @lastminus = Catalog.first(5)
  end
  
  def sold_minus
    @soldminus = Catalog.where(:sold => true).first(5)
  end
  
end
