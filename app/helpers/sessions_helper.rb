module SessionsHelper
  def current_user
    @current_user ||= User.joins(:role).includes(:role).where(users: {id: session[:user_id]}).first
  end

  def logged_in?
    !!current_user
  end
end
