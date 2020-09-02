class WallpostcommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @wallpost = Wallpost.find(params[:wallpost_id])
    @wallpostcomment = @wallpost.wallpostcomments.create(wallpostcomment_params.merge(commenter: current_user.name))
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @wallpost = Wallpost.find(params[:wallpost_id])
    @wallpostcomment = @wallpost.wallpostcomments.find(params[:id])
    @wallpostcomment.destroy
    redirect_to user_path(@user)
  end

  private

  def wallpostcomment_params
    params.require(:wallpostcomment).permit(:content)
  end
end
