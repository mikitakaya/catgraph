class Admin::UsersController < ApplicationController
  def index
   @users = User.page(params[:page]).per(5)
  end

  def show
   @user = User.find(params[:id])
   # 1ページあたりの表示件数を「6件」に設定
   @post_images = @user.post_images.page(params[:page]).per(6)
  end

  def edit
  end

  def update
  end
end
