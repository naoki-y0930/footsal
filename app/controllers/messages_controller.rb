class MessagesController < ApplicationController

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
    @message = Message.create(params.require(:message).permit(:content, :read_flg, :room_id, :user_id).merge(user_id: current_user.id))
  else
    flash[:messageerror] = "メッセージ送信に失敗しました"
  end
  redirect_to "/rooms/#{@message.room_id}"
  end

end
