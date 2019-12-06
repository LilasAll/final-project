# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :authenticate_user, only: %i[edit update destroy]

  # GET /comments
  def index
    @comment = Comment.all
  end

  # GET /comments/1
  def show
    @comment = Comment.where(event_id: :event_id, id: params[:id])
 end

  # GET /comments/new

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    # @gossip = Gosssip.find(@comment.gosssip_id)
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.event_id = params[:event]
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to event_path(params[:event]), flash: { success: ' Commentaire ajoute' }
    else
      redirect_to event_path(params[:event]), flash: { danger: ' erreur lors de la création du commentaire' }

    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to event_path(@comment.event_id), flash: { success: ' Commentaire modifie' }
    else
      render 'edit'
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to event_path, flash: { success: ' Le commentaire a ete detruit' }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content)
  end

  def authenticate_user
    unless current_user.id == @comment.user_id
      flash[:danger] = 'Acces restreint'
      redirect_to events_path
    end
    end
end
