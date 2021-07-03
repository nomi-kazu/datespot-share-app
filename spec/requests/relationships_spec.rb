require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  describe 'フォロー機能のテスト' do

    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it '200ステータスが返ってくる' do
        post account_follows_path(other_user), xhr: true
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていない場合' do
      it 'フォローすると401ステータスが返ってくる' do
        post account_follows_path(other_user), xhr: true
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'フォロー機能解除のテスト' do

    context 'ログインしている場合' do
      before do
        sign_in user
      end

      context 'ログインしている場合' do
        before { user.follow!(other_user) }

        it '200ステータスが返ってくる' do
          post account_unfollows_path(other_user), xhr: true
          expect(response).to have_http_status(200)
        end
      end
    end

    context 'ログインしていない場合' do
      it 'フォロー解除すると401ステータスが返ってくる' do
        post account_unfollows_path(other_user), xhr: true
        expect(response).to have_http_status(401)
      end
    end
  end

end