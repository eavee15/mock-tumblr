class CommentsController < ApplicationController

  def index
    comments
  end

  def new
    new_comment
  end

  def create
    new_comment(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @comment.post
    else
      render :new
    end
  end

private
  
  def post
    @post ||= Post.find(params[:post_id])
  end

  def comments
    @comments ||= post.comments
  end

  def new_comment(params={})
    @comment ||= post.comments.build(params)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

end