class PostsController < ApplicationController

  def index
    @posts = current_user.posts
  end

  def new
    @post = current_user.posts.build
  end

  def create
    current_user_id = current_user.id
    post_hash_id = SecureRandom.uuid.upcase
    ## build method is called by model having has_many method
    @post = current_user.posts.build(content: post_params[:content], image_file: post_params[:image_file],hash_id: post_hash_id)
    if @post.save
      flash[:success] = "投稿が完了しました。"
      redirect_to "/posts"
    else
      render "posts/new"
    end
  end

  def show
    @post = current_user.posts.find_by(hash_id: params[:hash_id])
  end

  def destroy
    post = current_user.posts.find_by(hash_id: params[:hash_id])
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
