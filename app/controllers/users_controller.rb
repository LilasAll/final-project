class UsersController < ApplicationController

	def resource_params
	devise_parameter_sanitizer.for(:sign_up) {|user| user.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
	end

  def show

  	if params[:id].to_i == current_user.id.to_i
      @current_user = current_user
    else
      redirect_to "/"
    end
#on définit les évenements créés
    @events = Event.all

#on affiche les evenements où le current user est l'admin, même chose pour les articles

  	#@created_events = @events.where(creator_id: @current_user.id)
  	#@created_articles = @earticles.where(author: @current_user.id)

  	@created_events = @events.where(creator_id: @current_user.id)
  	#@created_articles = @articles.where(author: @current_user.id)

    @attendances = Attendance.all


  end

end
