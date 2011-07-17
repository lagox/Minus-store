#encoding:utf-8
module NewsHelper
  
  def empty_news
    if @news.empty?
      "Новостей нету"
    end
  end
  
end
