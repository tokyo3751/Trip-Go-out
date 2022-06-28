class ReplysController < ApplicationController

 def create
   posts = Post.find(params[:post_id])
   reply = current_user.replys.new(reply_params)
   reply.post_id = posts.id
   reply.save
   redirect_to post_path(posts)
 end

 def destroy
   Reply.find(params[:id]).destroy
   redirect_to post_path(params[:post_id])
 end

 private

 def reply_params
  params.require(:reply).permit(:reply)
 end
end
