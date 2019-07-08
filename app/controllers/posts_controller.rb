class PostsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post, notice: 'Post was successfully created.'
    # if @post.save
    #   redirect_to @post#, notice: 'Post was successfully created.'
    # else
    #   render :new
    # end
  end

  def index
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

end
