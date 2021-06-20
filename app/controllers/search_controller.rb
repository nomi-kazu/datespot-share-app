class SearchController < ApplicationController
  def index
    @search = params[:search]
    @posts = Post.search(@search)
    @tag_lists = Tag.all.limit(15)

    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
  end 
end