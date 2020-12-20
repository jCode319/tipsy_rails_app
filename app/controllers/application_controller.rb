class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    flash[:message] = "Please log in"
    redirect_to '/' if !logged_in?
  end

  # def redirect_to_proper_path
  #     if cookies[:last_visited]
  #       redirect_to cocktail_bars_path(cookies[:last_visited])
  #     else
  #       redirect_to current_user
  #     end
  # end

end
