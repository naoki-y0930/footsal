class TeamDetail < ApplicationRecord
  belongs_to :user

  #検索機能
  def self.search(search)
    TeamDetail.where(['team_level LIKE ?', "%#{search}%"])
    return User.all unless search
  end
end
