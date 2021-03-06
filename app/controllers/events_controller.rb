# frozen_string_literal: true

class EventsController < ApplicationController
  # pour n'autoriser que les users à aller sur la page secrète :
  before_action :authenticate_user!, only: %i[new show edit]

  def index
    @events = Event.all
  end

  # pour les recerches / ici on recherche par description /
  def search
    @events = Event.where('description LIKE ?', '%' + params[:q] + '%')
  end

  def new
    # permet de comprendre les erreurs du formaulaire new
    @event = Event.new
  end

  def show
    # on ne montre les events qu'à ceux qui sont connectés :

    if user_signed_in?
      @event = Event.find(params[:id])
      gon.event = @event
      gon.event.latitude = @event.latitude
      gon.event.longitude = @event.longitude
      gon.creator = @event.creator
      gon.user = current_user

      @attending_list = @event.attendances # liste des participants
      puts '*' * 100
      puts @attending_list.count
      puts '*' * 100

      @comments = @event.comments

    # ceux qui ne sont pas connectés sont renvoyés à la page login
    else
      flash[:alert] = 'You need to be connected to see the events'
      redirect_to new_user_session_path
    end
  end

  def create
    date = (params[:start_date] + ' ' + params[:hour_start]).in_time_zone
    @event = Event.new(
      creator: current_user,
      title: params[:title],
      start_date: date,
      duration: params[:duration],
      description: params[:description],
      price: params[:price],
      location: params[:location],
      latitude: params[:latitude],
      longitude: params[:longitude]
    )
    if @event.price == nil
      @event.price = 0
    else
    end
    
    @event.tags = Tag.where(id: params[:tag_id])

    # @event.creator_id = current_user.id
    @event.image_event.attach(params[:image_event])

    # voir les détails dans la console :
    puts @event.errors.full_messages
    puts '*' * 100
    puts params
    # si les bons paramètres sont là, on enregistre l'event
    if @event.save
      flash[:success] = 'Evènement enregistré 👍 (Il doit maintenant être validé par un administrateur)'
      # on renvoit à l'index
      redirect_to events_path

    else
      # il manque qqchose ou il y a une erreur, on reste sur la page de création (view new)
      flash.now[:danger] = 'Une erreur est survenue, veuillez réessayer'
      render 'new'
      @tags = Tag.all

    end
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    if Attendance.exists?(event: @event)
      Attendance.where(event: @event).each(&:destroy)
    end
    # après l'action de destruction, on renvoit à l'accueil
    if @event.destroy
      flash[:success] = 'Evènement supprimé '
      redirect_to '/'
     end
  end

  def edit
    @event = Event.find(params['id'])
    @hour_start = params[:hour_start]
    gon.event = @event
  end

  def update
    @event = Event.find(params[:id])
    date = (params[:start_date] + ' ' + params[:hour_start]).in_time_zone
    # ATTENTION, AVEC CETTE METHODE IL FAUT RECHARGER L'IMAGE ET LA DATE A CHAQUE FOIS

    if @event.update(title: params[:title], description: params[:description], start_date: date, location: params[:location], price: params[:price], latitude: params[:latitude], longitude: params[:longitude])
      @event.image_event.purge
      @event.image_event.attach(params[:image_event])
      redirect_to @event
    else
      render :edit
    end
  end

  def check_if_admin
    redirect_to root_path unless current_user.admin?
 end

  # Pour l'admin pour valider les events
  def toggle_check
    @event = Event.find(params[:event_id])
    @is_validated = if @event.is_validated == false
                      @event.update(is_validated: true)
                      flash[:success] = 'Evénement accepté !'

                    else
                      @event.update(is_validated: false)
                      flash[:danger] = 'Evénement non-accepté !'

                    end
    redirect_to request.referer
  end

  private

  def post_params
    params.require(:post).permit(:author, :content, :all_tags)
  end
end
