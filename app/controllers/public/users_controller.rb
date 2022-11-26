class Public::UsersController < ApplicationController

  def show
   @user = User.find(params[:id])
   # 1ページあたりの表示件数を「6件」に設定
   @post_images = @user.post_images.page(params[:page]).per(6)
  end

  def edit
   @user = current_user
  end

  def update
   @user = current_user
   @user.update(user_params)
   redirect_to user_path(@user.id)
  end

  def unsubscribe
   @user = current_user
  end

  def withdraw
   @user = current_user
   # ユーザーステータスをtrue（退会）に更新する
   @user.update(is_deleted: true)
   reset_session
   flash[:notice] = "退会処理を実行いたしました"
   redirect_to root_path
  end

  def favorites
   favorited_image_ids = current_user.favorited_post_images.reverse.pluck(:id)
   @favorited_post_images = PostImage.where(id: favorited_image_ids)
                                    .order_as_specified(id: favorited_image_ids).page(params[:page]).per(8)
  end

  def search
   @users = User.search(params[:word])
  end

  private

  # ユーザーデータのストロングパラメータ
  def user_params
   params.require(:user).permit(:name, :username, :introduction, :email, :is_deleted, :profile_image)
  end

end
