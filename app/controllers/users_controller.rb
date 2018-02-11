class UsersController < ApplicationController
  skip_before_action :require_login, only: [:sign_up, :first_update]

  def sign_up
    @user = User.find_by(uuid: params[:uuid])
    redirect_to root_path if @user.signed_up
  end

  def first_update
    @user = User.find_by(uuid: params[:uuid])
    @user.signed_up = true
    if @user.update(user_params)
      session[:user_id] = @user.id
      flash[:success] = "You've signed up successfully!"
      redirect_to root_path
    else
      render 'sign_up'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :github_username, :password, :password_confirmation)
  end
end

