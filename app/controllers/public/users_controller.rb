class Public::UsersController < ApplicationController

  def show
   @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  private
  # ユーザーデータのストロングパラメータ
  def customer_params
   params.require(:customer).permit(:name, :username, :introduction, :email, :is_deleted)
  end

end
