class RequestsController < ApplicationController
  def new

  end
  def create

  end
  def index
    @category = Category.find_by(id: params[:category_id])
    @inventories = []  
  end
end
