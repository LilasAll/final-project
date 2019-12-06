class SearchController < ApplicationController
  def index
    @user = User.all
  	@event = Event.all
  end


end
