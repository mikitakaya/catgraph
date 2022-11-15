class Public::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :favorites]

  def show
  # 1ページあたりの表示件数を「6件」に設定
   @post_images = @user.post_images.page(params[:page]).per(6)
  end

  def edit
  end

  def update
   @user.update(user_params)
   redirect_to user_path(@user.id)
  end

  def unsubscribe
  end

  def withdraw
  end

  def favorites
   favorited_image_ids = Favorite.where(user_id: @user.id).pluck(:post_image_id)
   @favorite_post_images = PostImage.where(id: favorited_image_ids).page(params[:page]).per(8)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # ユーザーデータのストロングパラメータ
  def user_params
   params.require(:user).permit(:name, :username, :introduction, :email, :is_deleted, :profile_image)
  end

end
