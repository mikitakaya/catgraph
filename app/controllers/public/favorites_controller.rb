class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_post_image, only: [:create, :destroy]

  def create
   Favorite.create(user_id: current_user.id, post_image_id: @post_image.id)
   redirect_to post_image_path(@post_image)
  end

  def destroy
   favorite = Favorite.find_by(user_id: current_user.id, post_image_id: @post_image.id)
   favorite.destroy
   redirect_to request.referer
  end

  private
  def set_post_image
    @post_image = PostImage.find(params[:post_image_id])
  end

end
