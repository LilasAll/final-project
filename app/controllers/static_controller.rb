# frozen_string_literal: true

class StaticController < ApplicationController
  def index
    @user = User.all
    @event = Event.all
   end

  def team; end
end
