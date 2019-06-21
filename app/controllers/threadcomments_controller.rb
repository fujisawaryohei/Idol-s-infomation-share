class ThreadcommentsController < ApplicationController
  def index
    @threadcomments = ThreadComment.order(created_at: :DESC).all
  end

  def new
    @threadcomment = ThreadComment.new
  end

  def create
    thread = Thread.find_by(hash_id: params[:hash_id])
    @threadcomment = ThreadComment.new(comment: set_params[:comment], user_id: current_user.id,threader_id: thread.id, hash_id: ramdom_token)
  end

  def destory
  end

  private
  def set_params
    params.require(:threadcomment).permit(:comment)
  end
end
