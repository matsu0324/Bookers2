# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
#絶対パスから相対パス指定
env :PATH, ENV['PATH']
# ログファイルの出力先
set :output, 'log/cron.log'
# ジョブの実行環境設定
set :environment, :development
# every 12.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
  # every 1.minutes do
  every 1.days, at: '9:00 am' do
  # Rails内のメソッド実行
  runner "DailyMailer.notify_user"
end
#   runner "AnotherModel.prune_old_records"

# Learn more: http://github.com/javan/whenever

# require File.expand_path(File.dirname(__FILE__) + "/environment")
# rails_env = Rails.env.to_sym
# set :environment, rails_env
# set :output, 'log/cron.log'
# every 2.minute do
#   begin
#     runner "Batch::SendMail.notify_user"
#   rescue => e
#     Rails.logger.error("aborted rails runner")
#     raise e
#   end
# end