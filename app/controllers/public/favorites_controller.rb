class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :post_image_params, only: [:create, :destroy]

  def create
   Favorite.create(user_id: current_user.id, post_image: @post_image.id)
   # post_image = PostImage.find(params[:post_image_id])
   # favorite = current_user.favorites.new(post_image_id: post_image.id)
   favorite.save
   redirect_to post_image_path(post_image)
  end

  def destroy
   favorite = Favorite.find_by(user_id: current_user.id, post_image_id: @post_image.id)
   # post_image = PostImage.find(params[:post_image_id])
   # favorite = current_user.favorites.find_by(post_image_id: post_image.id)
   favorite.destroy
   redirect_to post_image_path(post_image)
  end

  private
  def post_image_params
    @post_image = PostImage.find(params[:post_image_id])
  end

end
