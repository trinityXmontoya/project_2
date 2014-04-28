class MessagesController < ApplicationController

  def index
  end

  def show
    @message.update(viewed: true)
  end

  def new
  end

  def edit
  end
end
