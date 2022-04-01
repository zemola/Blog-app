class CommentsController < ApplicationController
  def new
    @new_comment = Comment.new
  end

  def create
    # @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @new_comment = @current_user.comments.new(params)
    @new_comment.author_id = @post.id
    @new_comment.post_id = params[:post_id]
    @new_comment.update_comments_counter

    if @new_comment.save
      redirect_to user_post_path(@post.id, Post.find(params[:post_id]))
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
