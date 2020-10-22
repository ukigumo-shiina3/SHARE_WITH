class MessagesController < ApplicationController
  def create
    if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
      redirect_to "/rooms/#{@message.room_id}"
  end

  def destroy
      @message = Message.find(params[:id])
      room_id = @message.room_id
      @message.destroy
      flash[:alert] = "メッセージを削除しました。"
      redirect_to "/rooms/#{room_id}"
  end
end
