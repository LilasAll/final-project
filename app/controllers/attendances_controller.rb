class AttendancesController < ApplicationController
	def index
		# @event = Event.find(params["id"])
		# @attendance = @event.user.ids
	end


	def new
		@attendance = Attendance.new
		@event = Event.find(params[:event_id])
	end

	def create
		#on indique quel est l'evenement qui correspond
		@event = Event.find(id: params[:event_id])

	  

#Attention, création de la participation ne se fait pas avec attendance new ici car elle dépend de event (voir dans routes.rb)
		@attendance = @event.attendances.new(	#stripe_customer_id: customer.id,
		 															#amount: charge.amount, 
		 															#currency: charge.currency,
		 															user_id: current_user.id,
		 															event_id: @event.id)


		if @attendance.save # essaie de sauvegarder en base @comment
	    # si ça marche, il redirige vers la page du gossip

	    flash[:notice] = 'Participation validée!'
	    redirect_to event_path(@event.id) 



	  else
	    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
	  	flash[:notice] = "Une erreur est survenue"
	  	redirect_to event_path(@event.id)
  	end

		#regroupe tous types d'erreur
		# rescue Stripe::CardError => e
		#   flash[:error] = e.message
		#   redirect_to new_attendance_path

	end

end

