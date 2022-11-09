class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # ユーザー登録(sign_up)の際に、名前（name）とユーザー名（username）のデータ操作を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
  end
end
