class GamesController < ApplicationController
  def show
    @game = Game.find params[:id]
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new game_params

    if @game.save
      redirect_to @game
    else
      render :new
    end
  end

  private
  def game_params
    params.require(:game).permit(:title, :description, :releasedate, :boxart)
  end
end
