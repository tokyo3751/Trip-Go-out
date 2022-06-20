class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  # 新規登録後のリダイレクト先をマイページへ
    def after_sign_in_path_for(resource)
      if current_user
        flash[:notice] = "ログインに成功しました"
        root_path  #　指定したいパスに変更
      else
        flash[:notice] = "新規登録が完了しました"
        user_path  #　指定したいパスに変更
      end
    end

  protected

  def configure_permitted_parameters
    # デフォルトにないnickname/gender/ageを追加しているので、それらを許可するよう記載している
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:gender,:age])
  end
end
