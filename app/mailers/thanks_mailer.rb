class ThanksMailer < ApplicationMailer
  def auto_contact(user, contact)
    @user = user
    @answer = contact.reply_text
    mail to: user.email, subject: '[Booker]ご登録ありがとうございます'
  end
end
