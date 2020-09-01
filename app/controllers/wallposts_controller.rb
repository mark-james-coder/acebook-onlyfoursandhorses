class WallpostsController < ApplicationController
  before_action :logged_in_user
  
  def new
    @user = User.find(params[:user_id])
    @wallpost = Wallpost.new
  end

  def create
    @user = User.find(params[:user_id])
    @wallpost = @user.wallposts.create(wallpost_params.merge(poster: current_user.name))

    redirect_to user_path(@user)
  end

  private

  def wallpost_params
    params.require(:wallpost).permit(:content)
  end
end
