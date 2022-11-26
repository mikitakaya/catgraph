class Public::HomesController < ApplicationController
  def top
   @post_images = PostImage.all.order("created_at DESC").limit(4)
  end

  def about
  end
end
