require 'pry'
class GamesController < ApplicationController
  def index
    @games = Game.all
  end
  
  def show
    @game = Game.find params[:id]
    @review = @game.reviews.build
    if can? :create, Userreview
      if @game.userreviews.any?
        @user_score = @game.userreviews.where(user_id: current_user.id) #.last.score
        if @user_score.any?
          @user_score = @user_score.last.score
        end
      else
        @user_score = 1
      end
    end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new game_params
    save_console_associations(@game)

    if @game.save
      redirect_to @game
    else
      render :new
    end
  end

  def edit
    @game = Game.find params[:id]
  end

  def update
    @game = Game.find params[:id]
    @game.consoles.delete_all
    save_console_associations(@game)
    if @game.update(game_params)
      redirect_to @game
    else
      render :edit
    end
  end

  def destroy 
    @game = Game.find params[:id]
    @game.destroy
    redirect_to :root
  end

  private
  def game_params
    params.require(:game).permit(:title, :description, :releasedate, :boxart, :console_id => [])
  end

  def console_params
    params.require(:console).permit(:console_id => [])
  end

  def save_console_associations game 
    console_ids = console_params[:console_id]
    console_ids.reject! {|c| c.empty? }
    if console_ids.any?
      game.consoles << Console.find(console_ids)
    end
  end
end
