class OrderMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def send_email(user)
    @user = user
    mail(to: @user.email, subject: "Order Success! Order ID:#{@user.id}")
  end
  helper_method :send_mail
end
