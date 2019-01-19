class ExchangesController < ApplicationController
  def show
    @exchange = Exchange.find_by(params[:id])
    @messages = Message.all
    @message = Message.new
  end
end
