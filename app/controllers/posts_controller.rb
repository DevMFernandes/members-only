class PostsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      flash.now[:danger] = 'Post not saved.'
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

end
