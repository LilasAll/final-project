# frozen_string_literal: true

module CommentsHelper
  def right_user
    @event = Event.find(params[:event_id])
    @comment = @event.comments.find(params[:id])
    unless current_user.id == @comment.user_id
      redirect_to event_path(params[:event_id])
    end
    end
end
