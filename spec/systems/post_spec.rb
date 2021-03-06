require 'rails_helper'

RSpec.describe 'Post', type: :system do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user) }

  it '記事一覧が表示される' do
    visit root_path
    posts.each do |post|
      expect(page). to have_css('.post_title', text: post.title)
    end
  end

  it '詳細画面に遷移' do
    visit root_path
    first('.post_container').click
    expect(page). to have_css('.post_show_container')
  end

  describe 'ログインしている場合' do
    before do
      sign_in user
    end

    it '新規投稿画面へ遷移' do
      visit root_path
      click_link '新規投稿'
      expect(page).to have_css('.new_post_title', text: 'タイトル')
    end
  
    it '最低限の内容を入力し、投稿を保存できる' do
      visit new_post_path
      fill_in 'post[title]', with: '新規投稿'
      fill_in 'post[content]', with: 'Faker::Lorem.characters(number: 30)'
      select '東京', from: '都道府県'
      click_on '登録'
      expect(page).to have_css('.post_container', text: '新規投稿')
      expect(page).to have_content '投稿できました!'
    end

    it 'すべての項目を入力し、投稿を保存できる' do
      visit new_post_path
      fill_in 'post[title]', with: '新規投稿'
      fill_in 'post[content]', with: 'Faker::Lorem.characters(number: 30)'
      select '東京', from: '都道府県'
      fill_in 'post[area]', with: '渋谷'
      fill_in 'post[url]', with: 'Faker::Lorem.characters(number: 10)'
      fill_in 'post[tag_name]', with: 'Faker::Lorem.characters(number: 10)'
      click_on '登録'
      expect(page).to have_css('.post_container', text: '新規投稿')
      expect(page).to have_content '投稿できました!'
    end
  end
end