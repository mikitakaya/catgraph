class Public::UsersController < ApplicationController
 before_action :correct_user, only: [:edit, :update, :unsubscribe]
 # ログイン認証が済んでいない場合、userに関するページにアクセス不可、ログイン画面に遷移する
 before_action :authenticate_user!

  def show
   @user = User.find(params[:id])
   # 1ページあたりの表示件数を「6件」に設定
   @post_images = @user.post_images.page(params[:page]).per(6).order(id: "DESC")
   # 取得したユーザー名がゲストで、尚且つ、ログイン中ユーザー名がゲストではない場合
   # ゲストユーザー以外が、ゲストユーザーのshowページを開こうとした場合
   if @user.name == "ゲスト" && current_user.name != "ゲスト"
    # ログインユーザーのマイページにリダイレクトする
    redirect_to user_path(current_user.id)
   elsif @user.is_deleted == "no_active"
    redirect_to user_path(current_user.id)
   # ゲストユーザーは、ゲストユーザー以外のshowページを開こうとした場合
   elsif @user.name != "ゲスト" && current_user.name == "ゲスト"
    redirect_to user_path(current_user.id)
   end
  end

  def edit
   @user = User.find(params[:id])
   # 取得したユーザーの名前が「ゲスト」の場合
   if @user.name == "ゲスト"
    # マイページにリダイレクトする（編集ページを表示しない）
    redirect_to user_path(current_user.id)
   end
  end

  def update
   @user = current_user
   if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'プロフィールを更新しました'
   else
    render :edit
   end
  end

  def unsubscribe
   @user = current_user
  end

  def withdraw
   @user = current_user
   # ユーザーステータスをtrue（退会）に更新する
   @user.update(is_deleted: true)
   @user.profile_image.destroy
   @user.post_images.destroy_all
   @user.post_comments.destroy_all
   @user.favorites.destroy_all
   @user.relationships.destroy_all
   @user.reverse_of_relationships.destroy_all
   reset_session
   flash[:notice] = "退会処理を実行しました"
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

  def correct_user
   # レコードを取得
   @user = User.find(params[:id])
   # 取得したユーザーとログイン中ユーザーが一致しない場合、ユーザーの詳細ページにリダイレクトする
   redirect_to(user_path) unless @user == current_user
  end

end