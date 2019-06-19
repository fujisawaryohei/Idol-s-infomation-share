class ThreadersController < ApplicationController
  def index
    @threaders = Threader.order(created_at: :desc).all
  end

  def new
    @threader = Threader.new
  end

  def create
    @threader = Threader.new(title: set_params[:title], user_id: current_user.id, hash_id: ramdom_token)
    if @threader.save
      flash[:success] = "スレッドを投稿しました"
      redirect_to "/threaders"
    else
      render "threaders/new"
    end
  end

  def destroy
  end

  private
  def set_params
    params.require(:threader).permit(:title)
  end
end
