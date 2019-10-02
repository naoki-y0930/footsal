# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#初期ユーザー作成
User.create(name: "蹴球翼", captain_name: "ツバサ", team_name: "チームTSUBASA", tell: "08033334444", password: "tsubasa123")
User.create(name: "大空蹴り男", captain_name: "ケリオ", team_name: "チームBIGSKY",tell: "09055556666", password: "kerio123")

#初期adminの作成
Admin.create(email: "admin@example.com",password: "admin123")
