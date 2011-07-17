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
    begin
      @catalog = Catalog.find(params[:id])
      @title = @catalog.title
      respond_to do |format|
        format.html
        format.xml { render :xml => @catalog }
      end
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "Такой записи не существует"
      redirect_to stocks_path
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
  
  
  def sold
    begin
      @title = "Проданные минуса"
      @catalogs = Catalog.paginate_by_sql ['select * from catalogs where sold = ? 
                  order by id DESC', 1], :page => params[:page]
    rescue WillPaginate::InvalidPage
      flash[:notice] = 'Что делаешь? а?:)'
      redirect_to store_path
    end
  end
  
  def unsold
    begin
      @title = "Непроданные минуса"
      @catalogs = Catalog.paginate_by_sql ['select * from catalogs where sold = ? 
                  order by id DESC', 0], :page => params[:page]
    rescue WillPaginate::InvalidPage
      flash[:notice] = 'Что делаешь? а?:)'
      redirect_to store_path
    end
  end
  
end
