require 'rails_helper'

RSpec.describe 'ログインとログアウト' do
  before do
    @user = User.create!(username: 'samplename', email: 'example@co.com', password: 'aaaaaa')
  end

  describe 'ログイン' do
    it 'ログインできる' do
      visit new_user_session_path
      fill_in 'user[email]', with: 'example@co.com'
      fill_in 'user[password]', with: 'aaaaaa'
      click_on 'ログイン' 
      expect(page). to have_css('.post_index_title', text: '投稿一覧')
    end
  end

  describe 'ログアウト' do
    before do
      sign_in @user
    end

    it 'ログアウトできる' do
      visit root_path
      find('.dropdown_btn').click
      click_on 'ログアウト' 
      page.driver.browser.switch_to.alert.accept
      expect(page). to have_css('.post_index_title', text: '投稿一覧')
    end
  end
end