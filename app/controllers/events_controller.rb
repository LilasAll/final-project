class EventsController < ApplicationController

#pour n'autoriser que les users à aller sur la page secrète :
	# before_action :authenticate_user!, only: [:new]

  def index
  	@events = Event.all
  end

	def new
	#permet de comprendre les erreurs du formaulaire new
		@event = Event.new
	end

  def show
  		#on ne montre les events qu'à ceux qui sont connectés :
  	if user_signed_in?
			@event = Event.find(params[:id])
			@attending_list = @event.attendances #liste des participants

		#ceux qui ne sont pas connectés sont renvoyés à la page login
		else
			flash[:alert] = "You need to be connected to see the events"
			redirect_to new_user_session_path
		end
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

		@event.creator_id = current_user.id
		#@item.image_event.attach(params[:image_event])		

		#voir les détails dans la console :
		puts @event.errors.full_messages

		#si les bons paramètres sont là, on enregistre l'event
		if @event.save
			flash[:success] = "Evènement enregistré 👍"
			#on renvoit à l'index
			redirect_to events_path
		
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

  def check_if_admin
    redirect_to root_path unless current_user.admin?
 end

end
