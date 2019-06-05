require 'digest/md5'
class UsersController < ApplicationController

  def create
    @user = User.new(set_params(params[:user]))
    if @user
      @user.save
    else
      redirect_to :root
    end
  end

  def new
    @user = User.new
  end

  def destroy
  end

  private
  def set_params(params)
    params.require(:user).permit(:name, :email, :password, :confirmation_password)
  end
end
