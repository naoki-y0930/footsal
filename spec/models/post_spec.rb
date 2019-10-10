require 'rails_helper'
describe '投稿管理機能', type: :post do
  let(:user_a) {FactoryBot.create(:user, name: 'ユーザーA', tell: '08038587608', password: 'test')}
  describe '新規投稿機能' do
    before do
      FactoryBot.create(:post, title: 'title', body: 'test body', user_id: user_a.id)
      visit login_path
      fill_in '電話番号', with: login_user.tell
      fill_in 'パスワード', with: login_user.password
      click_button 'ログイン'
    end

    context 'ユーザーAがログインしている時' do
      let(:login_user) {user_a}
      it '新規投稿画面が表示される' do
        expect(view).to have_content 'new post'
      end
    end

  end
end
