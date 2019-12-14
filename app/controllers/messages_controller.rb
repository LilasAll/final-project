# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    @message = @conversation.messages.new
    @messages.mark_as_read! :all, for: current_user
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      @message.mark_as_read! for: current_user
      flash[:success] = 'Message envoyé!'
      redirect_to conversation_messages_path(@conversation)
    else
      flash[:error] = 'Une erreur est survenue..'
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
