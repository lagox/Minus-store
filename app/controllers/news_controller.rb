#encoding:utf-8
class NewsController < ApplicationController
  def index
    begin
    @title = "Новости"
    @news = Post.paginate_by_sql ['select * from posts where category = ?', 
                 Post::CATEGORY[0]], :page => params[:page]
    rescue WillPaginate::InvalidPage
      flash[:notice] = 'Что делаешь? а?:)'
      redirect_to news_path
    end
  end

  def show
    begin
      @new = Post.find(params[:id])
      respond_to do |format|
        format.html
        format.xml { render :xml => @new }
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to(news_path, :notice => "Такой записи не существует!")
    end
  end

end
