class ThanksMailer < ApplicationMailer
  def greeting(user)
    @greeting = "Thank You"
    @user = user
    mail to: @user.email, subject: '[Bookers]ご登録ありがとうございます'
  end
end
