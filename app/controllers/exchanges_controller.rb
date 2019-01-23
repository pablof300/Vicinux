class ExchangesController < ApplicationController

  def show
    @exchange = Exchange.find_by(id: params[:id])
    @request = Request.find_by(id: @exchange.meta_id)
    sorted_messages = []
    Message.all.each { |m| sorted_messages.append(m) if m.exchange_id == @exchange.id }
    @messages = sorted_messages
    @message = Message.new
  end

  def create
    request_id = params[:request_id]
    @exchange = Exchange.new(meta_id: request_id, open: true, incomplete: true)
    @exchange.users.append(current_user)
    @exchange.users.append(Request.find_by(id: request_id).user)
    if @exchange.save
      redirect_to exchange_path(@exchange)
    else
      puts "SOMETHING IS VERY WRONG"
    end
  end

  def destroy
    @exchange = Exchange.find(params[:id])
    @exchange.destroy
    flash[:success] = 'We have successfully dismissed this trade'
    redirect_to pending_path
  end

  def etrade
    @exchange = Exchange.find_by(id: params[:id])
    @exchange.open = false
    @exchange.save
    render :current
  end

  def pending
  end

  def current
  end

end
