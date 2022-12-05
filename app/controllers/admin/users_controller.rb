class Admin::UsersController < ApplicationController
  def index
   @users = User.page(params[:page]).per(5)
  end

  def show
   @user = User.find(params[:id])
   # 1ページあたりの表示件数を「6件」に設定
   @post_images = @user.post_images.page(params[:page]).per(6).order(id: "DESC")
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to admin_user_path(@user.id)
  end

  private

  # ユーザーデータのストロングパラメータ
  def user_params
   params.require(:user).permit(:name, :username, :introduction, :email, :is_deleted, :profile_image)
  end
end
