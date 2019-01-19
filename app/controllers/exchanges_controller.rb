class ExchangesController < ApplicationController

  def show
    @exchange = Exchange.find_by(params[:id])
    sorted_messages = []
    Message.all.each { |m| sorted_messages.append(m) if m.exchange_id == @exchange.id }
    @messages = sorted_messages
    @message = Message.new
  end
end
