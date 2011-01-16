#encoding:UTF-8
class PagesController < ApplicationController
  respond_to :html
  
  def index
    @title = "Главная"
  end

  def contacts
    @title = "Контакты"
  end
  
  def about
    @title = "О нас"
  end
  
end
