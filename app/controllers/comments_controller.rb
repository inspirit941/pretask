class CommentsController < ApplicationController
  before_action :check_authorization!
  def create
    @comment = Comment.new
    @comment.user_id = params[:user_id]
    @comment.post_id = params[:post_id]
    @comment.content = params[:content]
    @comment.save
    redirect_to '/posts/show/#{@comment.id}'
  end

  def destroy
    @comment = Comment.where(id: params[:id])
    @comment.destroy
    redirect_to '/posts/show/#{@comment.id}'
  end
end
