class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.exchange_id = params[:exchange_id]
    message.meta_id = params[:meta_id]
    if message.save
      ActionCable.server.broadcast "chatroom_channel", body: message_render(message)
    else

    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: { message: message })
  end

end
