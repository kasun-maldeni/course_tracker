class UsersController < ApplicationController
  skip_before_action :require_login, only: [:sign_up, :first_update]
  before_action :user_already_signed_up, only: [:sign_up, :first_update]

  def sign_up
  end

  def first_update
    if @user.update(first_update_params)
      session[:user_id] = @user.id
      flash[:success] = "You've signed up successfully!"
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      render 'sign_up'
    end
  end

  private
  def first_update_params
    params.require(:user).permit(:email, :first_name, :last_name, :github_username, :password, :password_confirmation).merge(is_signed_up: true)
  end

  def user_already_signed_up
    @user = User.find_by(uuid: params[:uuid])
    redirect_to root_path if @user.is_signed_up
  end
end
