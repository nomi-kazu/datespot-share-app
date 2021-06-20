require 'rails_helper'

RSpec.describe "Likes", type: :request do
  let!(:user) { create(:user) }
  let!(:new_post) { create(:post, user: user) }

  describe "Post posts/:post_id/like(post_id: post.id)" do

    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it "200ステータスが返ってくる" do
        post post_like_path(post_id: new_post.id, user_id: user.id), xhr: true
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていない場合' do
      it '401ステータスが返ってくる' do
        post post_like_path(post_id: new_post.id, user_id: user.id), xhr: true
        expect(response).to have_http_status(401)
      end
    end
  end
end