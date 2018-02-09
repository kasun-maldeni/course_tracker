class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  before_action :require_login

  private
  def require_login
    unless logged_in?
      flash[:error] = 'Please log in first'
      redirect_to '/login'
    end
  end
end
