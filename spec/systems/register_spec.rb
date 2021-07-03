require 'rails_helper'

RSpec.describe 'ユーザー登録' do

  it 'サインアップできる' do
    visit new_user_registration_path
    fill_in 'user[username]', with: 'samplename'
    fill_in 'user[email]', with: 'example@co.com'
    fill_in 'user[password]', with: 'aaaaaa'
    fill_in 'user[password_confirmation]', with: 'aaaaaa'
    click_on 'サインアップ'
    expect(page). to have_css('.post_index_title', text: '投稿一覧')
  end
end