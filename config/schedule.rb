# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
# require File.expand_path(File.dirname(__FILE__) + "/environment")
# cron実行時環境変数
# rails_env = ENV['RAILS_ENV'] || :development
# rails_env = Rails.env.to_sym
# rails_root = Rails.root.to_s
# cron実行時環境変数セット
# set :environment, rails_env
# set :output, "log/cron.log"

set :environment, "development"
set :output, { :error => "log/cron_error.log" }
set :path, "/vagrant/footsal"

env :PATH, ENV['PATH']
every 2.minutes do
rake "check_post:check_delete"
end
# set :environment, "production"
# set :output, { :error => "log/cron_error.log" }
# set :path, "/home/ec2-user/footsal"
#
# env :PATH, ENV['PATH']
# every 2.minutes do
# rake "check_post:check_delete"
# end
