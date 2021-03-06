require 'rails_helper'

RSpec.describe 'Profile', type: :system do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user) }

  describe 'ログインしている場合' do
    before do
      sign_in user
    end

    it 'プロフィール画面に遷移' do
      visit root_path
      find('#dropdown_icon').click
      click_link 'プロフィール' 
      expect(page).to have_css('.your_post', text: 'あなたの投稿一覧')
    end
  end
end