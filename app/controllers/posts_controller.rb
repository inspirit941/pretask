class PostsController < ApplicationController
  
  #skip_before_filter :verify_authenticity_token
  #protect_from_forgery prepend: true
  #protect_from_forgery prepend: true
  #before_action :set_bug, only: [:show, :edit, :update]
  before_action :authenticate_user!,except: [:index]
  #For Rails 5, note that protect_from_forgery is no longer prepended to the before_action chain, so if you have set authenticate_user before protect_from_forgery, your request will result in "Can't verify CSRF token authenticity." To resolve this, either change the order in which you call them, or use protect_from_forgery prepend: true.
  
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new
    @post.user_id = params[:input_user]
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    redirect_to post_path(@post)
  end

  def show
    #@post = Post.find(params[:id])
    @post=Post.find_by(id: params[:id])
    #@comment = @post.comments.find_by(params[:post_id])
    #@comment = @post.comments.find_by(params[:id]) 두개는 외형상 차이 없음
    @comment = @post.comments
  end

  def update
    @post = Post.find(params[:id])
    @post.user_id = params[:input_user]
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
    # @post.user_id = params[:input_user]
    # @post.title = params[:input_title]
    # @post.content = params[:input_content]
    #@post.save
    
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'
  end
end
