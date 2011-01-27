#encoding:utf-8
class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :user_name
  protect_from_forgery
  
  
  
  protected
  
    def user_name
      @user = User.find_by_id(session[:user_id])
    end
    
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => "Войдите в систему"
      end
    end
end
