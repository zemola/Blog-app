class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    new_like = @post.likes.new(
      author_id: @user.id,
      post_id: @post.id
    )
    new_like.update_likes_counter
    if new_like.save
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Success!'
    else
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", alert: 'Error occured!'
    end
  end
end
