class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
  def user_not_found
    render file: "#{Rails.root}/public/user_not_found.html", layout: true, status: :not_found
  end
  def post_not_found
    render file: "#{Rails.root}/public/post_not_found.html", layout: true, status: :not_found
  end
end
