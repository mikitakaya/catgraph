class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # ユーザー登録(sign_up)の際に、名前（name）とユーザー名（username）のデータ操作を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
  end

  private

  # サインイン後のリダイレクト先を指定
  def after_sign_in_path_for(resource_or_scope)
   if resource_or_scope.is_a?(Admin)
    # 管理者の場合は投稿一覧画面
    admin_top_path
   else
    # 上記に当てはまらない（顧客）場合、ルートパス
    user_path(@user.id)
   end
  end

  # サインアウト後のリダイレクト先を設定
  def after_sign_out_path_for(resource_or_scope)
   # 管理者の場合
   if resource_or_scope == :admin
    # 管理者ログイン画面
    new_admin_session_path
    # 顧客の場合
   elsif resource_or_scope == :public
    # ルートパス
    root_path
   else
    root_path
   end
  end

end
