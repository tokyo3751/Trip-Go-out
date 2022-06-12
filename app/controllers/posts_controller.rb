class PostsController < ApplicationController
  def new
    @post = Post.new
  end

   # 投稿データの保存
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    #コメントを投稿するためのインスタンス変数を定義する
    @reply = Reply.new
  end

  def edit
  end

  #投稿データの削除
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:image, :place, :comment)
  end
end
