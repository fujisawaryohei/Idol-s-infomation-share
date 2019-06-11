class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      flash[:sucess] = "投稿しました"
      redirect_to "/posts"
    else
      flash[:notice] = "入力されていない箇所があります。"
      redirect_to "/posts/new"
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
