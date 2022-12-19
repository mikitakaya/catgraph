class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :post_image_params, only: [:create, :destroy]

  def create
   Favorite.create(user_id: current_user.id, post_image_id: @post_image.id)
   redirect_to post_image_path(@post_image), notice: "お気に入り登録しました"
  end

  def destroy
   favorite = Favorite.find_by(user_id: current_user.id, post_image_id: @post_image.id)
   favorite.destroy
   redirect_to request.referer, notice: "お気に入り登録を削除しました"
  end

  private
  def post_image_params
    @post_image = PostImage.find(params[:post_image_id])
  end

end
