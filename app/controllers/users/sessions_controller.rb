class Users::SessionsController < Devise::SessionsController
  
    def guest_sign_in
      user = User.guest
      sign_in user
      redirect_to user_path(user), notice: 'ゲストでログインしました。'
    end
  
    def
        after_sign_in_path_for(resource)
        flash[:notice] = "ログインに成功しました"
        root_path
    end
end