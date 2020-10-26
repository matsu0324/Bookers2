if Rails.env.production?
   # メールの送信に失敗したときにエラーを出す
  ActionMailer::Base.raise_delivery_errors = true
  # メールの送信方法
  ActionMailer::Base.default_url_options = { :host => 'localhost:3000'}
  ActionMailer::Base.delivery_method = :smtp
    # 詳細の設定
  ActionMailer::Base.smtp_settings = {
    port:  587,
    address: 'smtp.gmail.com',
    domain:  'gmail.com',
    user_name:  'kmyk0723@gmail.com',
    password:  'Matsuyama0324',
    authentication:  'plain',
    enable_starttls_auto: true
  }
elsif Rails.env.development?
  ActionMailer::Base.delivery_method = :letter_opener_web
else
  ActionMailer::Base.delivery_method = :test
end