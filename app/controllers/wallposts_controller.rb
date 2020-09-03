class WallpostsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find_by(slug: params[:user_slug])
    @wallpost = @user.wallposts.create(wallpost_params.merge(poster: current_user.name))
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find_by(slug: params[:user_slug])
    @wallpost = Wallpost.find(params[:id])
  end

  def update
    @user = User.find_by(slug: params[:user_slug])
    @wallpost = Wallpost.find(params[:id])
    if @wallpost.update(wallpost_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(slug: params[:user_slug])
    @wallpost = @user.wallposts.find(params[:id])
    @wallpost.destroy

    redirect_to user_path(@user)
  end

  def add_like
    @user = User.find_by(slug: params[:user_slug])
    @wallpost = Wallpost.find_by(id: params[:wallpost_id])
    @wallpost.update(likes: (@wallpost.likes + 1))
    redirect_to user_path(@user)
  end

  private

  def wallpost_params
    params.require(:wallpost).permit(:content)
  end
end
