namespace :check_post do

  desc "check_delete"
  task check_delete: :environment do
     Post.where("created_at<?", Time.now-(2.minutes)).delete_all
     # Post.where("created_at>= ?", Time.zone.now.beginning_of_day)
     # Post.find(14).destroy
  end
end
