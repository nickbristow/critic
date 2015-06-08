class WelcomeController < ApplicationController
  def index
    @games = params[:q] ? Game.search_for(params[:q]) : Game.all
    @editors = params[:q] ? Editor.search_for(params[:q]) : Editor.all
  end
end
