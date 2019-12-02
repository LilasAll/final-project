class UserController < ApplicationController

   def show 
    
   	if params[:id].to_i == current_user.id.to_i
       @current_user = current_user
     else
      redirect_to "/"	

    end

  end
	
end
