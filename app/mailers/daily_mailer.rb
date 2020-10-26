# class DailyMailer < ApplicationMailer
#   def notify_user
#     default to: -> { User.pluck(:email) }
#     mail(subject: "everyday Bookers!yay!")
#   end
# end

class DailyMailer < ApplicationMailer
  def notify_user
    mail(:subject => "確認メール", bcc: User.pluck(:email))
  end
end
