class WelcomeController < ApplicationController
  include SessionsHelper
  def index
    if logged_in?
      @user = current_user
      redirect_to user_path(@user)
    else
      @user = User.new
      render 'index.html.erb'
  end
end
end
