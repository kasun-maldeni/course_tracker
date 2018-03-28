class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    redirect_to root_path if logged_in?
  end

  def create
    user = User.joins(:role).where(users: {email: params[:email]}).first
    if user && user.is_active && user.is_signed_up && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path if user.role.name === 'student'
      redirect_to admin_path if user.role.name === 'admin'
    else
      flash.now[:error] = 'invalid email/password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
