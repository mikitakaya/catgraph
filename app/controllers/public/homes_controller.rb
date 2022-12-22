class Public::HomesController < ApplicationController
  def top
   # 全ての投稿データを取得、作成日時の降順、4件のレコードを取得
   @post_images = PostImage.all.order("created_at DESC").limit(4)
  end

  def about
  end
end
