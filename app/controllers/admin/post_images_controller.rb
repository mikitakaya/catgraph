class Admin::PostImagesController < ApplicationController
 # ログイン認証が済んでいない場合、投稿詳細画面にアクセス不可、ログイン画面に遷移する
 before_action :authenticate_admin!
 def show
  # レコードを1件取得
  @post_image = PostImage.find(params[:id])
  # ユーザー＝投稿したユーザー
  @user = @post_image.user
 end

 def destroy
  # レコードを1件取得
  @post_image = PostImage.find(params[:id])
  # レコードを削除
  @post_image.destroy
  # レコードを削除後、投稿一覧画面にリダイレクトする
  redirect_to admin_top_path, notice: "投稿を削除しました"
 end
end
