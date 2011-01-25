#encoding:utf-8

class AdminController < ApplicationController
  def index
    @title = "Админка"
    @user = User.find_by_id(session[:user_id])
  end

end
