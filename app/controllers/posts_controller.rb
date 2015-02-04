class PostsController < ApplicationController
 def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    
    if @post.save
      flash[:notice] = "thanks for your post!"
    else
      flash[:alert] = "couldn't create post. please try again."      
    end
    
    redirect_to "/posts/#{@post.id}"
  end

  def show
    @post = Post.find(params[:id])
    @current_user = User.find(session[:user_id])
    @post_comments = @post.comments
    # @post.comments is the same as Comment.where(post_id == post.id)
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
    @current_user = User.find(session[:user_id])
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      flash[:notice] = "post updated!"
    else 
      flash[:alert] = "couldn't update post. please try again."
    end
    
    redirect_to "/posts/#{params[:id]}"
  end

  def destroy
    @post = Post.find(params[:id])
    
    if @post.destroy
      flash[:notice] = "post deleted!"
    else
      flash[:alert] = "couldn't delete post. please try again."
    end

    redirect_to "/"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end