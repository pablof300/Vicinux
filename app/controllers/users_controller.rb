class UsersController < ApplicationController

  before_action :require_user, only: [:dashboard]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    zipcode = params[:user][:zipcode]
    community = Community.find_by(zipcode: zipcode)
    community = Community.create(zipcode: zipcode) if community.nil?
    @user.community = community
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
    @new_messages = 0
    @current_trades = 0
    @user.exchanges.each do |exchange|
      if exchange.open
        new_messages += 1
      else
        current_trades += 1
      end
    end
  end

  def show
    @user = User.find(params[:id])
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
