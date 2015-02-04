class CommentsController < ApplicationController
 def index
    @comment = Comment.find(@post.id)
  end

  def edit
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(@post.id)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(comment_params)
    redirect_to post_path(params[:post_id]), notice: "Comment posted!"
  end

  def update
  end

  def destroy
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id).merge(post_id: @post.id)
  end

end