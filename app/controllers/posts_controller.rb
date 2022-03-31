class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    # @user = User.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
    render :new, locals: { post: @post }
  end

  def create
    @user = User.find(params[:user_id])
    @new_post = @user.posts.new(post_params)
    @new_post.likes_counter = 0
    @new_post.comment_counter = 0
    respond_to do |format|
      format.html do
        if @new_post.save
          redirect_to "/users/#{@new_post.author.id}/posts/", notice: 'Created Successfully'
        else
          render :new, alert: 'Failed to Create!'
        end
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
