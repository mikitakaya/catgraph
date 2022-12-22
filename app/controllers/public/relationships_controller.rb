class Public::RelationshipsController < ApplicationController
  # フォローする時
  def create
   # ログイン中ユーザーがフォローする
   current_user.follow(params[:user_id])
   # 遷移元画面にリダイレクトする
   redirect_to request.referer
  end

  # フォローを外す時
  def destroy
   # ログイン中ユーザーがフォローを外す
   current_user.unfollow(params[:user_id])
   # 遷移元画面にリダイレクトする
   redirect_to request.referer
  end

  # フォロー一覧
  def followings
   # レコードを1件取得
   @user = User.find(params[:user_id])
   # 全てのフォロー中ユーザー情報を取得、1ページあたりの表示件数は5件、フォローIDの降順で表示する
   @users = @user.followings.page(params[:page]).per(5).order("relationships.id DESC")
   pp @users
  end

  # 　フォロワー一覧
  def followers
   # レコードを1件取得
   @user = User.find(params[:user_id])
   # 全てのフォロワーユーザー情報を取得、1ページあたりの表示件数は5件、フォロワーIDの降順で表示する
   @users = @user.followers.page(params[:page]).per(5).order("relationships.id DESC")
   pp @users
  end
end
