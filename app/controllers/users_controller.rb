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
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def dashboard
    @user = User.find_by(id: session[:user_id])
  end

  def index
    if current_user
      redirect_to dashboard_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
