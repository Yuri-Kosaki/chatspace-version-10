class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @messages = Message.includes(:group).order("created_at ASC")
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @group = Group.find(params[:group_id])

    if @message.save
      redirect_to group_messages_path, notice: "メッセージを更新しました。"
    else
      redirect_to group_messages_path, alert: "送信したいメッセージがありません。"
    end

  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
