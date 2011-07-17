#encoding:utf-8
module StockHelper

  def empty_stock
    if @stocks.empty?
      "Акций нету"
    end
  end
  
end
