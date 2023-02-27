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
  # レコードを1件取得
  @post_comment = PostComment.find(params[:id])
  # コメント投稿者ID = ログイン中ユーザーIDですか
  if @post_comment.user_id == current_user.id
   # レコードを削除
   @post_comment.destroy
   # レコード削除後、投稿詳細画面にリダイレクトする
   redirect_to post_image_path(params[:post_image_id]), notice: "コメントを削除しました"
  else
   # コメントを投稿したユーザーとログイン中ユーザーが不一致の場合
   redirect_to post_image_path(params[:post_image_id]), notice: "他人のコメントは削除できません"
  end
 end

 private

 # 投稿コメントデータのストロングパラメータ
 def post_comment_params
  params.require(:post_comment).permit(:comment)
 end
end
