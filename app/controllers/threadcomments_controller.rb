class ThreadcommentsController < ApplicationController
  def index
    @threadcomments = ThreadComment.order(created_at: :DESC).all
  end

  def new
    @threadcomment = ThreadComment.new
  end

  def create
    @thread = Threader.find_by(hash_id: params[:id])
    @threadcomment = ThreadComment.new(comment: params[:comment], user_id: current_user.id,threader_id: @thread.id, hash_id: ramdom_token)
    if @threadcomment.save
      respond_to do |format|
        format.js
      end
    else
      flash[:notice] = "コメントができませんでした"
      redirect_to "/threaders/#{@thread.hash_id}"
    end
  end

  def destroy
    @thread = Threader.find_by(hash_id: params[:id])
    @threadcomment = ThreadComment.find_by(hash_id: params[:hash_id])
    @threadcomment.destroy
    redirect_to "/threaders/#{@thread.hash_id}"
  end
end
