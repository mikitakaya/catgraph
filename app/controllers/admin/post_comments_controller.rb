class Admin::PostCommentsController < ApplicationController
  def destroy
   PostComment.find(params[:id]).destroy
   redirect_to admin_post_image_path(params[:post_image_id]), notice: "コメントを削除しました"
  end

end
