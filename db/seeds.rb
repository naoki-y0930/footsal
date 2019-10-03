# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#初期adminの作成
# Admin.create(email: "admin@example.com",password: "admin123")

#ユーザーとチーム情報作成
user = User.create!(
  name: "蹴球翼",
  captain_name: "ツバサ",
  team_name: "チームTSUBASA",
  tell: "08033334444",
  password: "tsubasa123",
  team_detail_attributes: {
      experience: 5,
      beginner: 5,
      male: 7,
      female: 3,
      team_level: '中級',
      active_area: '大阪',
      active_time: '夜',
  }
)
user = User.create!(
  name: "大空かける",
  captain_name: "カケル",
  team_name: "チームKAKERU",
  tell: "08033335555",
  password: "kakeru123",
  team_detail_attributes: {
      experience: 10,
      beginner: 10,
      male: 12,
      female: 8,
      team_level: '上級',
      active_area: '京都',
      active_time: '昼',
  }
)
