class ThanksMailer < ApplicationMailer
  default from: ""
  # メールのレイアウトを指定するViewが格納されるディレクトリ
  def greeting(user)
    @user = user
    mail(to: @user.email, subject: "会員登録が完了しました。")
  end
  
    # mail(:subject => "登録完了のお知らせ", to: user.email)

# お試し③
    # mail(
    #   subject: "会員登録が完了しました。",
    #   to: @user.email
    # ) do |format|
    #   format.text
    # end
  # end
end
