class SearchController < ApplicationController
  def index
    @posts = Post.search(params[:search])
    @tag_lists = Tag.all.limit(3)

    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
  end 
end