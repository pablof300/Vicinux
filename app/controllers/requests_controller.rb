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

  private

  def request_params
    params.require(:request).permit(:item_name, :description)
  end
end
