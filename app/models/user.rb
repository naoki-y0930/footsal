class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:authentication_keys => [:tell]

  attachment :image
  has_one :team_detail, dependent: :destroy
  accepts_nested_attributes_for :team_detail ,allow_destroy: true
  has_many :posts, dependent: :destroy
   # usernameを必須・一意とする
   validates_uniqueness_of :name, :team_name, :captain_name, :tell
   validates_presence_of :name, :team_name, :captain_name, :tell

  # No use email
 def email_required?
   false
 end

 def email_changed?
  false
 end

 def will_save_change_to_email?
   false
 end

 #検索機能
 def self.search(search)
   return User.all unless search
   User.where(['content LIKE ?', "%#{search}%"])
 end

end
