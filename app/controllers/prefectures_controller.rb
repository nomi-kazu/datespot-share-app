class PrefecturesController < ApplicationController
  def index
    @params = params[:prefecture]
    @posts = Post.where(prefecture: @params)

    @tag_lists = Tag.all.limit(15)

    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10)
  end
end