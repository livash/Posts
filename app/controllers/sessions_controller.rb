class SessionsController < ApplicationController
  include ApplicationHelper

  def new
  end

  def create
    @user = User.find_by_username(params[:user][:username])

    if (@user && @user.verify_password(params[:user][:password]))
      @user.reset_session_token!
      @user.save!
      session[:session_token] = @user.session_token
      redirect_to friend_circle_url(current_user.friend_circles.first)
    else
      render :new
    end
  end

  def destroy
    if current_user
      current_user.logout!
      session[:session_token] = nil
    end

    render :new
  end
end
