#encoding:utf-8
class StuffController < ApplicationController
  
  def index
    begin
    @title = "Полезные ссылки"
    @stuffs = Link.paginate :page => params[:page]
    rescue WillPaginate::InvalidPage
      flash[:notice] = 'Что делаешь? а?:)'
      redirect_to stuff_path    
    end
  end

end
