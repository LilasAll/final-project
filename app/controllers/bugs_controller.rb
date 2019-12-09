# frozen_string_literal: true

class BugsController < ApplicationController
  def index
    @bugs = Bug.all
  end

  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.create(
      content: params[:content],
      user_name: current_user
    )

    if @bug.errors.any?
      flash[:danger] = 'Problème avec la création du bug.'
      render 'new'
    else
      flash[:notice] = 'Merci de nous aider !'
      redirect_to root_path

 end
  end

  def show
    @bugs = Bug.all
  end

  def destroy
    @bug = Bug.find_by(id: params[:id])

    # après l'action de destruction, on renvoit à l'accueil
    if @bug.destroy
      flash[:success] = 'Bug supprimé'
      redirect_to bugs_path
     end
  end
end
