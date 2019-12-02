class EventsController < ApplicationController
  def index
  	@events = Event.all
  end

  def show
  end

  def create

	@event = Event.new(
			creator: current_user,
			title: params[:title],
			start_date: params[:start_date],
			duration: params[:duration],
			description: params[:description],
			price: params[:price],
			location: params[:location],
			)
		@event.creator_id = @current_user.id

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

  	def destroy

  	@event= Event.find_by(id:params[:id])

  	#après l'action de destruction, on renvoit à l'accueil
  	if @event.destroy
  		flash[:success] = "Evènement supprimé 👍"
  		redirect_to "/"
		end
	end

	def edit
		@event = Event.find(params["id"])
	end



end
