class CommentsController < ApplicationController
  #before_action :authenticate_user!, except: [:create, :delete]
  def create
    @post = Post.find(params[:comment_post_id])
    #@post = Post.find_by(params[:id])
    @comment = @post.comments.new(post_id: params[:post_id])
    #@comment = Comment.new(post_id: params[:post_id])
    #@comment.user_id = params[:comment_user_id]
    @comment.user_id = current_user.id
    @comment.post_id = params[:comment_post_id]
    @comment.content = params[:comment_content]
    @comment.save!
    redirect_to post_path(@comment.post_id)
    #redirect_to post_path()
  end
  

  def destroy
    @post = Post.find(params[:post_id])
    #@comment = @post.comments.where(post_id: params[:post_id])
    @comment = Comment.where(id: params[:id])
    @comment.destroy(params[:id])
    redirect_to post_path(@post)
  end
  private

  # def commentParams
  #   params.require(:comment).permit(:user_id, :post_id, :content)
  # end
end
