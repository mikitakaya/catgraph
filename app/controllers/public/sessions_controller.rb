# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
 # before_action :configure_sign_in_params, only: [:create]

 # GET /resource/sign_in
 # def new
 #   super
 # end

 # POST /resource/sign_in
 # def create
 #   super
 # end

 # DELETE /resource/sign_out
 # def destroy
 #   super
 # end

 # protected

 # If you have extra params to permit, append them to the sanitizer.
 # def configure_sign_in_params
 #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
 # end

 # アクションの前に処理を実行
 before_action :user_state, only: [:create]

 def guest_sign_in
  user = User.guest
  sign_in user
  # ユーザーのマイページにリダイレクトする
  redirect_to user_path(user), notice: 'ゲストユーザーでログインしました'
 end

 protected
 # 退会しているかを判断するメソッド
 def user_state
  # 入力されたemailからアカウントを1件取得
  @user = User.find_by(email: params[:user][:email])
  # アカウントを取得できなかった場合、このメソッドを終了する
  return if !@user
  # 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  if @user.valid_password?(params[:user][:password])
   # 取得したアカウントのis_deletedがno_active（true、退会）の場合
   if @user.is_deleted == "no_active"
    # 退会済みのため、新規登録画面へリダイレクトする
    redirect_to new_user_registration_path, notice: '退会済みのため、新規登録が必要です'
   end
  end
 end
end