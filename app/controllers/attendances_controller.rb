# frozen_string_literal: true

class AttendancesController < ApplicationController
  def index
    # @event = Event.find(params["id"])
    # @attendance = @event.user.ids
  end

  def new
    @event = Event.find(params[:event_id])
    puts '*' * 100
    puts params
  end

  def create
    # on indique quel est l'evenement qui correspond
    @event = Event.find(params[:event_id])

    # Amount in cents
    @amount = @event.price * 100

    if @amount == 0

      @attendance = @event.attendances.new(event_id: @event.id, user_id: current_user.id)
      flash[:notice] = 'Subscription validated' if @attendance.save # essaie de sauvegarder en base @comment

    else

      # creation d'un client en 2 paramètres
      customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: params[:stripeToken] # stripetoken représente la méthode de paiement
      )

      # création de la participations
      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'eur'
      )

      # Attention, création de la participation ne se fait pas avec attendance new ici car elle dépend de event (voir dans routes.rb)
      @attendance = @event.attendances.new(stripe_customer_id: customer.id,
                                           amount: charge.amount,
                                           currency: charge.currency,
                                           user_id: current_user.id,
                                           event_id: @event.id)

      if @attendance.save # essaie de sauvegarder en base @comment
        # si ça marche, il redirige vers la page du gossip

        flash[:success] = 'Yeah ! Vous avez rejoins un événement !'

      else
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
        flash[:error] = 'Oh, une erreur est survenue '
      end

       # regroupe tous types d'erreur
       # rescue Stripe::CardError => e
       #   flash[:error] = e.message
       #   redirect_to new_attendance_path
     end

    redirect_to event_path(@event.id)
  end

  #  private
  # # Use callbacks to share common setup or constraints between actions.
  # def set_event_registration
  #   @event_registration = EventRegistration.find(params[:id])
  # end

  # def event_registration_params
  #  params.require(:event_registration).permit(:user_id, :event_id)
  # end
end
