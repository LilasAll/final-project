# frozen_string_literal: true

class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.all


end

  def new
    @recipient = params[:recipient_id]
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    

    else
      @conversation = Conversation.create!(conversation_params)

    end
    redirect_to conversation_messages_path(@conversation)
  end

  def destroy
        @conversation = Conversation.find(params[:id])

    @conversation.destroy
    redirect_to conversations_path, flash: { success: ' La conversation a ete detruite' }
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
