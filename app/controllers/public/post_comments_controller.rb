class Public::PostCommentsController < ApplicationController

  def create
   # レコードを1件だけ取得
   post_image = PostImage.find(params[:post_image_id])
   comment = current_user.post_comments.new(post_comment_params)
   comment.post_image_id = post_image.id
   if comment.save
    redirect_to post_image_path(post_image), notice: "コメントの作成に成功しました"
   else
    redirect_to post_image_path(post_image), notice: "コメントの作成に失敗しました"
   end
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  def post_comment_params
   params.require(:post_comment).permit(:comment)
  end
end
