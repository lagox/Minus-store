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
  
end
