class Admin::UsersController < ApplicationController
 # ログイン認証が済んでいない場合、userに関する画面にアクセス不可、ログイン画面に遷移する
 before_action :authenticate_admin!

 def index
  # 全てのユーザーデータを取得、1ページあたりの表示件数を「5件」に設定
  @users = User.page(params[:page]).per(5)
 end

 def show
  # レコードを1件取得
  @user = User.find(params[:id])
  # ユーザーに属する全ての投稿データを取得、1ページあたりの表示件数を「6件」に設定、投稿IDの降順に表示する
  @post_images = @user.post_images.page(params[:page]).per(6).order(id: "DESC")
 end

 def edit
  # レコードを1件取得
  @user = User.find(params[:id])
 end

 def update
  # レコードを1件取得
  @user = User.find(params[:id])
  # ユーザー情報を更新した際に、ステータスが退会（true）の場合
  if @user.update(user_params) && @user.is_deleted == true
   # ユーザーに属するプロフィールイメージを削除
   @user.profile_image.destroy
   # ユーザーに属する全ての投稿を削除
   @user.post_images.destroy_all
   # ユーザーに属する全てのコメントを削除
   @user.post_comments.destroy_all
   # ユーザーに属するお気に入り登録を全て削除
   @user.favorites.destroy_all
   # ユーザーに属するフォロー登録を削除
   @user.relationships.destroy_all
   # ユーザーに属するフォロワー登録を削除
   @user.reverse_of_relationships.destroy_all
   # ユーザー詳細画面へリダイレクト
   redirect_to admin_user_path(@user.id), notice: "退会処理を実行しました"
  elsif @user.update(user_params)
   # ユーザー詳細画面へリダイレクト
   redirect_to admin_user_path(@user.id), notice: "ユーザー情報を更新しました"
  else
   render :edit
  end
 end

 def destroy
  # レコードを1件取得
  @user = User.find(params[:id])
  # レコードを削除
  @user.destroy
  # ユーザー一覧画面へリダイレクト
  redirect_to admin_users_path, notice: "ユーザー情報を削除しました"
 end

 private

 # ユーザーデータのストロングパラメータ
 def user_params
  params.require(:user).permit(:name, :username, :introduction, :email, :is_deleted, :profile_image)
 end
end
