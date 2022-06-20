class FavoritesController < ApplicationController

  def create
    posts = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: posts.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    posts = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: posts.id)
    favorite.destroy
    redirect_to request.referer
  end

end
