class Public::PostCommentsController < ApplicationController
 def create
  # レコードを1件取得し、ローカル変数「post_image」へ格納する
  post_image = PostImage.find(params[:post_image_id])
  # 新しいコメントを生成し、ローカル変数「comment」へ格納する
  comment = current_user.post_comments.new(post_comment_params)
  # コメントをした投稿＝取得した投稿
  comment.post_image_id = post_image.id
  # コメントを作成できた場合
  if comment.save
   flash[:notice] = "コメントの作成に成功しました"
  else
   flash[:notice] = "コメントの作成に失敗しました"
  end
  # 投稿詳細画面にリダイレクトする
  redirect_to post_image_path(post_image)
 end

 def destroy
  # レコードを取得し、削除する
  PostComment.find(params[:id]).destroy
  # 投稿詳細画面にリダイレクトする
  redirect_to post_image_path(params[:post_image_id]), notice: "コメントを削除しました"
 end

 private

 # 投稿コメントデータのストロングパラメータ
 def post_comment_params
  params.require(:post_comment).permit(:comment)
 end
end
