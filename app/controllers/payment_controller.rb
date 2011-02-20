#encoding:utf-8
class PaymentController < ApplicationController

  def index
    if params[:ik_payment_id]
      @title = "Спасибо за покупку!"
      flash[:notice] = "Поздравляем с покупкой!"
      id = params[:ik_payment_id]
      @sold_minus = Catalog.find(id)
      @sold_minus.update_attribute(:sold,1)
    else
      flash[:notice] = "Оплатите покупку!"
      redirect_to store_path
    end
  end
  
  def error
    if params[:ik_payment_id]
      @title = "Платеж не выполнен!"
      flash[:notice] = "Платеж не выполнен!"
    else
      flash[:notice] = "Оплатите покупку!"
      redirect_to store_path
    end
  end
end
