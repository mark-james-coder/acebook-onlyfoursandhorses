class PostcommentsController < ApplicationController

  # def new
  #   @postcomment = Postcomment.new
  # end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @postcomment = @post.postcomments.create(postcomment_params.merge(commenter: current_user.name))
    redirect_to user_post_path(@user, @post)
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @postcomment = @post.postcomments.find(params[:id])
    @postcomment.destroy
    redirect_to user_post_path(@user, @post)
  end

  private

  def postcomment_params
    params.require(:postcomment).permit(:content)
  end
end
