class UsersController < ApplicationController

  before_action :require_user, only: [:dashboard]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Vicinux #{@user.username}"
      session[:user_id] = @user.id
      redirect_to dashboard_path(@user)
    else
      render 'new'
    end
  end

  def dashboard
    @user = User.find_by(id: session[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
