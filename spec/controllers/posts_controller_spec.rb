require 'rails_helper'
RSpec.feature "Homeページ、サインアップ、ログイン、ログアウトに関するテスト", type: :controllers do
  before do
    @user = FactoryBot.create(:user)
  end

feature "ログインの確認" do
  before do
    visit new_user_session_path
    find_field('user[tell]').set(@user.tell)
    find_field('user[password]').set(@user.password)
    find("input[name='commit']").click
  end
  scenario "正しくログインして、リダイレクトされているか" do
    expect(page).to have_current_path home_path
  end
  scenario "サクセスメッセージは正しく表示されるか" do
    expect(page).to have_content "ようこそ、フッサルへ！！"
  end
end
end
