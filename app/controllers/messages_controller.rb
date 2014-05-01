class MessagesController < ApplicationController

  def show
    @message = Message.find(params[:id])
    @new_message = Message.new
    @user = User.find(params[:user_id])
    unless @message.viewed
      @message.mark_as_viewed
    end
    @bidders = @user.find_bidders
  end

  def create
    @message = Message.new(content:params[:message][:'content'],sender_id: current_user.id,receiver_id: (params[:message][:'receiver_id']), auction_id: params[:message][:auction_id])
    @auction = Auction.find(@message.auction_id)
    if @auction.is_completed?
      redirect_to @auction, notice: "Sorry, this auction is over and messaging is disabled."
    else
      @message.save!
      respond_to do |format|
        format.html{redirect_to @message, notice: "Message sent!"}
      end
    end
  end

  # def email_user
  #   @message = Message.create(content:params[:message][:content],sender_id: params[:message][:auction].user_id,receiver_id: params[:message][:bid].user_id)
  #   respond_to do |format|
  #     format.html{redirect_to @message}
  #     format.js {}
  #   end
  # end

  private
  def message_params
    params.require(:message).permit(:content)
  end


end
