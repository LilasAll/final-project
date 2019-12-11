# frozen_string_literal: true

class UsersController < ApplicationController
  def resource_params
    devise_parameter_sanitizer.for(:sign_up) { |user| user.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
  end

  def index
    @conversations = Conversation.all
  end

  def search_user
    @users = User.where('pseudo LIKE ?', '%' + params[:q] + '%')
end

  def show
    @conversations = Conversation.all

    @user = User.find(params[:id])

    @current_user = current_user

    # on définit les évenements créés
    @events = Event.all

    # on affiche les evenements où le current user est l'admin, même chose pour les articles

    # @created_events = @events.where(creator_id: @current_user.id)
    # @created_articles = @earticles.where(author: @current_user.id)

    @created_events = @events.where(creator_id: @current_user.id)
    # @created_articles = @articles.where(author: @current_user.id)

    @attendances = Attendance.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to cohorts_path

    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to '/'
  end

  def toggle_check
    @user = User.find(params[:user_id])
    @is_admin = if @user.is_admin == false
                  @user.update(is_admin: true)
                else
                  @user.update(is_admin: false)
                    end
    redirect_to '/'
  end
end
