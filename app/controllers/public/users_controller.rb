class Public::UsersController < ApplicationController
  before_action :set_user, only: [:favorites]

  def show
   # レコードを1件だけ取得
   @user = User.find(params[:id])
  # 1ページあたりの表示件数を「6件」に設定
   @post_images = @user.post_images.page(params[:page]).per(6)
  end

  def edit
   # レコードを1件だけ取得
   @user = User.find(params[:id])
  end

  def update
   # レコードを1件だけ取得
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to user_path(@user.id)
  end

  def unsubscribe
  end

  def withdraw
  end

  def favorites
   favorites = Favorite.where(user_id: @user.id).pluck(:post_image_id)
   @favorite_posts = PostImage.find(favorites)
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
