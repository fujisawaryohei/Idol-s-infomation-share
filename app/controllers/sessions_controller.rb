class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      remember @user
      flash[:success] = "ログインしました。"
      redirect_to "/users/#{@user.hash_id}"
    else
      flash[:notice] = "正しく入力してください"
      redirect_to "/login"
    end
  end

  def destroy
    log_out
    redirect_to "/login", notice: "ログアウトしました。"
  end
end
