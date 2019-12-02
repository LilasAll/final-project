class UsersController < ApplicationController

def resource_params
devise_parameter_sanitizer.for(:sign_up) {|user| user.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
end

end
