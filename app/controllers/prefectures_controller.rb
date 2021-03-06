class PrefecturesController < ApplicationController
  def index
    @params = params[:prefecture]
    @posts = Post.where(prefecture: @params).order(created_at: :desc)
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10)

    @tag_lists = Tag.all.limit(15)

    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10)
  end
end