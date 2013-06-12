class UsersController < ApplicationController
  include ApplicationHelper

  def new
    @user = User.new
  end

  def create
    if params[:user][:password].length < 3
      render :new
    end

    @user = User.new(params[:user])
    if @user.save
      render :json => @user
    else
      render :new
    end

  end


end
