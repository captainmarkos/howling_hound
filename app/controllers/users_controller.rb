class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create! user_params
    @user.image.attach(params[:user][:image])

    redirect_to edit_user_path(@user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    user.image.attach(params[:user][:image])

    redirect_to edit_user_path(user.id)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end
end
