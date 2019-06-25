class PostsController < ApplicationController

  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    current_user_id = current_user.id
    post_hash_id = SecureRandom.uuid.upcase
    @post = Post.new(content:post_params[:content], image_file:post_params[:image_file], user_id:current_user_id, hash_id: post_hash_id)
    if  @post.save
      flash[:success] = "投稿が完了しました。"
      redirect_to "/posts"
    else
      flash[:notice] = "投稿が完了しませんでした。"
      redirect_to "/posts/new"
    end
  end

  def show
    @post = Post.find_by(hash_id: params[:hash_id])
  end

  def edit
  end

  def update
  end

  def destroy
    post = Post.find_by(hash_id: params[:hash_id])
    if post
      post.delete
      redirect_to "/posts"
    else
      flash[:notice] = "削除中に不具合が起きたため削除できませんでした。"
      render "/posts/#{post.hash_id}"
    end
  end

  private

  def post_params
    params.require(:post).permit(:content,:image_file)
  end
end
