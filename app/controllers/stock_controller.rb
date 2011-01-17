#encoding:utf-8
class StockController < ApplicationController
  def index
    begin
      @stocks = Post.paginate_by_sql ['select * from posts where category = ?', 
                    Post::CATEGORY[1]], :page => params[:page]      
    rescue WillPaginate::InvalidPage
      flash[:notice] = 'Что делаешь? а?:)'
      redirect_to stock_path
    end                  
  end

  def show
    begin
      @stock = Post.find(params[:id])
      respond_to do |format|
        format.html
        format.xml { render :xml => @stock }
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to(stocks_path, :notice => "Такой записи не существует!")
    end
  end

end
