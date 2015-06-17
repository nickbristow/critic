class WelcomeController < ApplicationController
  def index
    @games = params[:q] ? Game.search_for(params[:q]) : Game.last(10).reverse
    @editors = params[:q] ? Editor.search_for(params[:q]) : Editor.last(10).reverse
  end
  
  def about
  end
end