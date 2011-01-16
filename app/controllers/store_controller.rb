#encoding:UTF-8
class StoreController < ApplicationController
  def index
    begin
    @catalogs = Catalog.paginate :page => params[:page]
    @title = "Каталог"
    rescue WillPaginate::InvalidPage
      flash[:notice] = 'Что делаешь? а?:)'
      redirect_to store_path
    end
  end
  
  def show
    @catalog = Catalog.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @catalog }
    end
  end
  
  def pay
    begin
    @catalog = Catalog.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "Выберите минус"
      redirect_to store_path
    end
  end
  
  def create
    if params[:name].nil?
      flash[:notice] = "Доступ запрещен"
      redirect_to store_path
    else
      @name = params[:name]
      @email = params[:email]
      @pay_type = params[:pay_type]
      @message = params[:message]
      @minus = params[:minus]
      if UserMailer.want_pay(@name, @email, @pay_type, @message, @minus).deliver
        flash[:notice] = "С Вами скоро свяжутся :)"
        redirect_to store_path
      else
        flash[:notice] = "Что-то пошло не так"
        redirect_to store_path      
      end
    end
  end
  
end
