class Admin::PostCommentsController < ApplicationController
 def destroy
  # レコードを1件取得し、削除する
  PostComment.find(params[:id]).destroy
  # 投稿詳細画面にリダイレクトする
  redirect_to admin_post_image_path(params[:post_image_id]), notice: "コメントを削除しました"
 end
end
