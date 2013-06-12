class FriendCirclesController < ApplicationController
  include ApplicationHelper
  before_filter :verify_user

  def new
    @circle = FriendCircle.new
    @users = User.all
  end

  def create
    @circle = current_user.friend_circles.build(params[:friend_circle])

    if @circle.save
      render :show
    else
      redirect_to new_friend_circle_url
    end
  end

  def show
    render :show
  end

  def edit
    @users = User.all
    @circle = FriendCircle.find(params[:id])
  end

  def update
    @circle = FriendCircle.find(params[:id])
    if @circle.update_attributes(params[:friend_circle])
      render :show
    else
      redirect_to new_friend_circle_url
    end
  end
end
