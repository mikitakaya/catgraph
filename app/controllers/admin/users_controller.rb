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
   # ユーザー情報を更新した際に、ステータスが退会の場合
   if @user.update(user_params) && @user.is_deleted == "no_active"
    @user.profile_image.destroy
    @user.post_images.destroy_all
    @user.post_comments.destroy_all
    @user.favorites.destroy_all
    @user.relationships.destroy_all
    @user.reverse_of_relationships.destroy_all
    reset_session
    flash[:notice] = "退会処理を実行しました"
   else
    flash[:notice] = "ユーザー情報を更新しました"
   end
   redirect_to admin_user_path(@user.id)
  end

  private

  # ユーザーデータのストロングパラメータ
  def user_params
   params.require(:user).permit(:name, :username, :introduction, :email, :is_deleted, :profile_image)
  end
end
