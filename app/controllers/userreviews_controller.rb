class UserreviewsController < ApplicationController
  def create
    @game = Game.find params[:game_id]
    userreview = @game.userreviews.create(user_reviews_params)
    redirect_to game_path(@game)
  end
  private
  def user_reviews_params
    params[:userreview][:user_id] = current_user.id
    params.require(:userreview).permit(:score, :user_id)
  end
end
