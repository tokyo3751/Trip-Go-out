class RelationshipsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @users = user.followings
    @user = user.followers
  end

  def create
    Relationship.create(follower_id: current_user.id, followed_id: params[:user_id])
    redirect_to user_path(params[:user_id]), notice: "フォローしました"
  end

  def destroy
    other_user = User.find(params[:user_id])
    current_user.unfollow(other_user)
    redirect_to user_path(params[:user_id]), notice: "フォローを解除しました"
  end

  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
