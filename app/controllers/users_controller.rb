class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[show edit destroy]

  def show
    if User.find_by(slug: params[:slug])
      @user = User.find_by(slug: params[:slug])
      @wallpost = @user.wallposts
    else
      user_not_found
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = 'Welcome to Acebook!'

      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(session[:user_id])

    if @user.update(user_params)
      flash[:success] = 'Update Successful!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.destroy

    redirect_to '/'
  end

  def search
    if User.find_by(slug: params[:search].parameterize)
      @parameter = params[:search].parameterize
      @result = User.find_by(slug: @parameter)
      redirect_to user_path(@result)
    else
      @user = current_user
      flash[:danger] = 'User not found'
      redirect_to(user_path(@user))
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
