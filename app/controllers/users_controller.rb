class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    user.hash_id = SecureRandom.uuid.upcase
    if user.save
      log_in user
      remember user
      flash[:success] = "登録が完了しました。"
      redirect_to "/users/#{user.hash_id}"
    else
      flash[:notice] = "名前やメールアドレスを正しく入力してください"
      render 'users/new'
    end
  end

  def show
    @current_user = User.find_by(hash_id: params[:hash_id])
  end

  def new
    @user = User.new
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
