# require 'rails_helper'
# RSpec.describe User, type: :model do
#
#   it "名前があれば登録できる" do
#     expect(FactoryBot.create(:name)).to be_valid
#   end
#
#   it "パスワードがなければ登録できない" do
#      expect(FactoryBot.build(:user, password: "")).to_not be_valid
#   end
#
#   it "パスワードが暗号化されているか" do
#     user = FactoryBot.create(:user)
#     expect(user.password_digest).to_not eq "password"
#   end
#
#
# end
