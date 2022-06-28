class FavoritesController < ApplicationController

  #いいねする
  def create
    @posts = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: @posts.id)
    favorite.save
  end

  #いいねを外す
  def destroy
    @posts = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @posts.id)
    favorite.destroy
  end

end
