class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.favorite_posts
    @tag_lists = Tag.all.limit(15)
    
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
  end
end