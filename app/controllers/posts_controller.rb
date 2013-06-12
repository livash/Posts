class PostsController < ApplicationController
  include ApplicationHelper
  before_filter :verify_user

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      render :show
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

end
