class WelcomeController < ApplicationController
  def index
    @games = params[:q] ? Game.search_for(params[:q]) : Game.all
  end
end
