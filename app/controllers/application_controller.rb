class ApplicationController < ActionController::Base
  protect_from_forgery


  helper_method :current_user?

  before_filter :get_user

  def current_user?
    !!current_user
  end

  def current_user
    @current_user ||= session[:user_id] &&
      User.find_by_id(session[:user_id])
  end

  def check_logged_in
    redirect_to( new_session_path, :notice => "You must be logged in to do that!") unless current_user?
  end

  def get_user
    @user = User.new
  end

end
