class Public::UsersController < ApplicationController

  def show
   # レコードを1件だけ取得
   @user = User.find(params[:id])
  # @userが投稿したpost_imageを全て取得する
   @post_images = @user.post_images
  end

  def edit
   # レコードを1件だけ取得
   @user = User.find(params[:id])
  end

  def update
<<<<<<< HEAD
   # レコードを1件だけ取得
   @user = User.find(params[:id])
   @user.update(user_params)
=======
   # ログイン中のユーザー
   @user = current_user
   @user.update(user_params_update)
>>>>>>> origin/main
   redirect_to user_path(@user.id)
  end

  def unsubscribe
  end

  def withdraw
  end

  private
  # ユーザーデータのストロングパラメータ
<<<<<<< HEAD
  def user_params
=======
  def user_params_update
>>>>>>> origin/main
   params.require(:user).permit(:name, :username, :introduction, :email, :is_deleted, :profile_image)
  end

end
