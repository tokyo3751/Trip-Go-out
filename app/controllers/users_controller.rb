class UsersController < ApplicationController
   before_action :set_user, only: [:favorites]

  def index
  end

  def show
    @user = User.find(params[:id])
    @post = @user.post
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
