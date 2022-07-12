class Admins::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
   @user = User.all
  end

  def show
   @user = User.find(params[:id])
   @post = @user.post
  end

  def destroy
   @user = User.find(params[:id])
   @user.destroy
   flash[:notice] = 'ユーザーを削除しました。'
   redirect_to admins_users_path
  end

  private

   def user_params
    params.require(:user).permit(:nickname, :profile_imag, :age, :gender)
   end

   def post_params
    params.require(:post).permit(:place, :comment, :address)
   end

   def set_user
     @user = User.find_by(:id => params[:id])
   end

   def set_post
     @post = Post.find_by(:id => params[:id])
   end
end
