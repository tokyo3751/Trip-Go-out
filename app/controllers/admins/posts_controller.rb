class Admins::PostsController < ApplicationController
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = '投稿を削除しました。'
    redirect_to admins_users_path
  end
end
