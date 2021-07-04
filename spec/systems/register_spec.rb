require 'rails_helper'

RSpec.describe 'アカウント作成' do

  it 'アカウント作成できる' do
    visit new_user_registration_path
    fill_in 'user[username]', with: 'samplename'
    fill_in 'user[email]', with: 'example@co.com'
    fill_in 'user[password]', with: 'aaaaaa'
    fill_in 'user[password_confirmation]', with: 'aaaaaa'
    click_on 'アカウント作成'
    expect(page). to have_css('.post_index_title', text: '投稿一覧')
  end
end