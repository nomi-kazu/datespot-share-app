class SearchController < ApplicationController
  def index
    @search = params[:search]
    @posts = Post.search(@search).order(created_at: :desc)
    @tag_lists = Tag.all.limit(15)

    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10)
  end 
end