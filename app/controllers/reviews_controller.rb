class ReviewsController < ApplicationController
  def create
    @game = Game.find params[:game_id]
    @game.reviews.create(reviews_params)
    redirect_to game_path(@game)
  end

  def destroy 
    @review = Review.find params[:id]
    game = @review.game
    @review.destroy
    redirect_to game_path(game)
  end

  private
  def reviews_params
    params.require(:review).permit(:score, :link, :editor_id)
  end

end
