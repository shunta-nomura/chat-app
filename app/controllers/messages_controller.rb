class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end
  
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      #@messageは@roomのroute上では支配下なのでこのように記載
      redirect_to room_messages_path(@room)
      #redirectによって実際にページが更新される
    else
      @messages = @room.messages.includes(:user)
      render :index
      #ページは同じだけどrender :indexはページの更新がないので書いた内容がそのままである
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end