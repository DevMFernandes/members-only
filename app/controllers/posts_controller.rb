class PostsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create]

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def index
  end

  private

  def post_params
    params.require(:user).permit(:body)
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

end
