class ThanksMailer < ApplicationMailer
  # メールのレイアウトを指定するViewが格納されるディレクトリ
  def greeting(user)
    @user = user
    mail(:subject => "登録完了のお知らせ", to: user.email)
  end
end
