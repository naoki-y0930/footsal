namespace :check_post do

  desc "check_delete"
  task check_delete: :environment do
    # postを作成してから指定した時間経過すれば削除
     Post.where("created_at<?", Time.now-(60.minutes)).delete_all
  end
end
