class EventsController < ApplicationController
  def index
  end

  def show
  end

  def create

	@event = Event.new(
			admin: current_user,
			title: params[:title],
			start_date: params[:start_date],
			duration: params[:duration],
			description: params[:description],
			price: params[:price],
			location: params[:location],
			)
		@event.admin_id = @current_user.id

		#si les bons paramètres sont là, on enregistre l'event
		if @event.save
			flash[:success] = "Evènement enregistré 👍"
			#on renvoit à l'index
			redirect_to event_path(@event.id)
		
		else
    	#il manque qqchose ou il y a une erreur, on reste sur la page de création (view new)
    	flash.now[:danger] = "Une erreur est survenue, veuillez réessayer"
    	render 'new' 
    end

  end
end
