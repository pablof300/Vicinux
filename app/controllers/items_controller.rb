class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @item.date = Date.today
    if @item.save
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "Incorrect information"
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_path(current_user)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id)
  end
end
