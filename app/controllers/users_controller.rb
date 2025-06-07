class UsersController < ApplicationController
  def index
    @users = User.all.order(:username)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "User created successfully"
    else
      render :new
    end
  end
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to setting_user_path(@user), notice: "Settings updated"
    else
      render :setting, status: :unprocessable_entity
    end
  end

  def setting
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :night_mode, :desc)
  end
end
