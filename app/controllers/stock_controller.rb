#encoding:utf-8
class StockController < ApplicationController
  skip_before_filter :authorize
  respond_to :html
  
  def index
    begin
      @title = "Акции"
      @stocks = Post.paginate_by_sql ['select * from posts where category = ? order 
                by id DESC', 
                    Post::CATEGORY[1]], :page => params[:page]      
    rescue WillPaginate::InvalidPage
      flash[:notice] = 'Что делаешь? а?:)'
      redirect_to stock_path
    end                  
  end

  def show
    begin
      @stock = Post.find(params[:id])
      @title = @stock.title
    rescue ActiveRecord::RecordNotFound
      redirect_to(stocks_path, :notice => "Такой записи не существует!")
    end
  end

end
