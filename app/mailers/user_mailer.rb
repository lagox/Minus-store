#encoding:utf-8
class UserMailer < ActionMailer::Base
  default :from => "some@example.com"
  default :to => "lagox.mail@gmail.com"
  
  def want_pay(name, email, pay_type, message, minus)
    @name = name
    @email = email
    @pay_type = pay_type
    @message = message
    @minus = minus
    mail(:subject => "Я хочу купить минус")                                                                    
  end
end
