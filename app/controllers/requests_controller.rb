class RequestsController < ApplicationController
  def index

  end

  def create
    @request = Request.new(request_params)
    @request.open = true
    @request.user_id = current_user.id
    @request.meta_id = params[:category_id]
    if @request.save
      flash[:success] = "You have successfully placed a request"
      redirect_to dashboard_path
    else
      flash.now[:danger] = "Your request information is incorrect"
      render :new
    end
  end

  def new
    @request = Request.new
    @category = Category.find_by(id: params[:category_id])
    @inventories = []
    User.all.each do |user|
      if user != current_user
        @inventories.append(user.items)
      end
    end
    @inCategory = []
    #@inventories.each { |i| if Category.find_by(id: i.category_id) == @category then @inCategory.append(i) end}
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_path
  end

  def trade_now
    @request = Request.new
    @request.user = current_user
    @request.open = true
    @request.item_name = params[:item_name]
    @request.description = params[:description]
    @request.meta_id = params[:category_id]
    @request.save

    @exchange = Exchange.new(meta_id: @request.id, open: true, incomplete: true)
    @exchange.users.append(current_user)
    @exchange.users.append(User.find_by(id: params[:user_id]))
    if @exchange.save
      redirect_to exchange_path(@exchange)
    end
  end

  private

  def request_params
    params.require(:request).permit(:item_name, :description)
  end
end
