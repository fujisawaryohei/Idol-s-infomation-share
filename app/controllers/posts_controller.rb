class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    current_user_id = current_user.id
    post_hash_id = SecureRandom.uuid.upcase
    @post = Post.new(content:post_params[:content], image_file:post_params[:image_file], user_id:current_user_id, hash_id: post_hash_id)
    if @post.valid?
      @post.save
      flash[:sucess] = "投稿が完了しました。"
      redirect_to "/posts"
    else
      redirect_to "posts/new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def post_params
    params.require(:post).permit(:content,:image_file)
  end
end
