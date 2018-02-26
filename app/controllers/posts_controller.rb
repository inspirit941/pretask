class PostsController < ApplicationController
  before_action :check_authorization!

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new
    @post.user_id = params[:input_user]
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    redirect_to '/posts/show/<%=@post.id%>'
  end

  def show
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
  end

  def edit
    @post = Post.find params[:id]
    @post.user_id = params[:input_user]
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    redirect_to '/posts/show/<%=@post.id%>'
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to '/'
  end
end
