class Admin::HomesController < ApplicationController
  def top
   # 1ページあたりの表示件数を「8件」に設定
   @post_images = PostImage.page(params[:page]).per(4).order(id: "DESC")
  end
end
