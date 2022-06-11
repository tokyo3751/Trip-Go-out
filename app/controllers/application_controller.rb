class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # デフォルトにないnickname/gender/ageを追加しているので、それらを許可するよう記載している
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:gender,:age])
  end
end
