class PostsController < ApplicationController

  def index
    @post = Post.order(created_at: :desc).all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: post_params[:content], image_file: post_params[:image_file], user_id: current_user.id, hash_id: ramdom_token)
    if @post.save
      flash[:success] = "投稿が完了しました。"
      redirect_to "/posts"
    else
      render "posts/new"
    end
  end

  def show
    @post = Post.find_by(hash_id: params[:hash_id])
  end

  def destroy
    post = Post.find_by(hash_id: params[:hash_id])
    if post
      post.delete
      redirect_to "/posts"
    else
      flash[:notice] = "削除中に不具合が起きたため削除できませんでした。"
      redirect_to "/posts/#{post.hash_id}"
    end
  end

  private

  def post_params
    params.require(:post).permit(:content,:image_file)
  end
end
