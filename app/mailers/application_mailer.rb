class ApplicationMailer < ActionMailer::Base
  # メーラークラスの実装ファイル。メールごとにメソッドを生成する
  default from: 'from@example.com'
  layout 'mailer'
end
