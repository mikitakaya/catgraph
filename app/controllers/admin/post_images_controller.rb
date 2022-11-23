class Admin::PostImagesController < ApplicationController
  def show
   # レコードを1件だけ取得
   @post_image = PostImage.find(params[:id])
   # ユーザー＝投稿したユーザー
   @user = @post_image.user
  end

  def destroy
   # レコードを1件だけ取得
   @post_image = PostImage.find(params[:id])
   # レコードを削除
   @post_image.destroy
   # レコードを削除後、投稿一覧画面にリダイレクトする
   redirect_to admin_top_path
  end
end
