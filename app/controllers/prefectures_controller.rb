class PrefecturesController < ApplicationController
  def index
    @params = params[:prefecture]
    @posts = Post.where(prefecture: @params)

    @tag_lists = Tag.all.limit(3)

    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
  end
end