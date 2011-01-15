#encoding:UTF-8
class PagesController < ApplicationController
  def index
    @title = "Главная"
  end

  def contacts
    @title = "Контакты"
  end
  
  def order
    @title = "Заказать"
  end

end
