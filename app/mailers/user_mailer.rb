class UserMailer < ApplicationMailer
	default from: 'synergie.urbaine@laposte.net'

	def welcome_email(user)
		@user = user
		@url = 'http://synergie-urbaine.herokuapp.fr'
		mail(to: @user.email, subject: 'Bienvenue à Synergie Urbaine')
	end

end
