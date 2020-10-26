class ApplicationMailer < ActionMailer::Base
  default from: "example@fff.com"
  # メーラークラスの実装ファイル。メールごとにメソッドを生成する
  layout 'mailer'
end
