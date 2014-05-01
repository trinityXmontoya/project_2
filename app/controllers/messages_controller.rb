class MessagesController < ApplicationController

  def index
    @messages = current_user.messages{auction_id :desc}
  end

  def show
    @message = Message.find(params[:message_id])
    @new_message = Message.new
    @user = User.find(params[:user_id])
    unless @message.viewed
      @message.mark_as_viewed
    end
  end

  def create
    @message = Message.create(content:params[:message][:content],sender_id: params[:message][:auction].user_id,receiver_id: params[:message][:bid].user_id)
    respond_to do |format|
      format.html{redirect_to @message}
      format.js {}
    end
  end

  def email_user
    @message = Message.create(content:params[:message][:content],sender_id: params[:message][:auction].user_id,receiver_id: params[:message][:bid].user_id)
    respond_to do |format|
      format.html{redirect_to @message}
      format.js {}
    end
  end



end
