class UsersController < ApplicationController
  before_action :limit_user_new, only: :new

  def create
    user = User.new(login_params)
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
    @user = User.find_by(hash_id: params[:hash_id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(hash_id: params[:hash_id])
  end

  def update
   @user = User.find_by(hash_id: params[:hash_id])
    if edit_params[:image_file]
      File.binwrite("app/assets/images/users/#{@user.hash_id}.jpg", edit_params[:image_file].read)
      edit_params[:image_file].original_filename = "#{@user.hash_id}.jpg"
      @user.update_attributes(image_file: edit_params[:image_file].original_filename, name: edit_params[:name], profile: edit_params[:profile])
      flash.now[:sucess] = "編集が完了しました"
      render 'users/show'
    elsif edit_params[:image_file].nil?
      @user.update_attributes(name: edit_params[:name], profile: edit_params[:profile])
      flash.now[:sucess] = "編集が完了しました"
      render 'users/show'
    else
      flash[:notice] = "正しく入力してください"
      redirect_to "/users/#{@user.hash_id}/edit"
    end
  end

  private

  def login_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def edit_params
    params.require(:user).permit(:image_file, :name, :profile)
  end

  def limit_user_new
    if !current_user.nil?
      flash[:notice] = 'このページへのアクセスは制限されています'
      redirect_to "/users/#{current_user.hash_id}"
    end
  end
end
