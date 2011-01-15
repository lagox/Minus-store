#encoding:UTF-8
class StoreController < ApplicationController
  def index
    @catalogs = Catalog.paginate :page => params[:page]
    @title = "Каталог"
  end

end
