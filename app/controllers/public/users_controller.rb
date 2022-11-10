class Public::UsersController < ApplicationController

  def show
   # 登録済みのデータを取得する
   @user = User.find(params[:id])
  # @userが投稿したpost_imageを全て取得する
   @post_images = @user.post_images
  end

  def edit
   # 登録済みのデータを取得する
   @user = User.find(params[:id])
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  private
  # ユーザーデータのストロングパラメータ
  def user_params
   params.require(:customer).permit(:name, :username, :introduction, :email, :is_deleted)
  end

end
