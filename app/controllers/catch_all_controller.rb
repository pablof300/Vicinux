class CatchAllController < ApplicationController
  def index
    if params[:path] && User.find_by(username: params[:path])
      redirect_to user_path(User.find_by(username: params[:path]))
    else
      render text: params.inspect
    end
  end
end
