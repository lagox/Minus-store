module ApplicationHelper
  
  def title
    @base_title = "Minus-store"
    if @title.nil?
      @base_title
    else
      @base_title + " | " + @title
    end
  end
  
end
