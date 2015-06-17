class UserreviewsController < ApplicationController
  def create
    @game = Game.find params[:game_id]
    userreview = @game.userreviews.create(user_reviews_params)
    update_metaweights @game, userreview
    redirect_to game_path(@game)
  end
  private
  def user_reviews_params
    params[:userreview][:user_id] = current_user.id
    params.require(:userreview).permit(:score, :user_id)
  end

  def update_metaweights game, userreview
    reviews = game.reviews
    user_score = userreview.score 
    reviews.each do |review|
      editor = review.editor
      meta = Metaweight.where("user_id = :user_id and editor_id = :editor_id", 
        { user_id: current_user.id, editor_id: editor.id })
      if !meta.any?
        meta = Metaweight.create([{user_id: current_user.id,
                                   editor_id: editor.id,
                                   weight: 0.0}])
      end
      meta = meta.last
      diff = percentage_difference user_score, review.score 
      meta.weight = meta.weight + diff
      meta.save
    end
  end

  def percentage_difference x, y
    x = x.to_f
    y = y.to_f
    if x > y
      (x - y)/((x + y)*2)
    elsif y > x
      (y - x)/((x + y)*2)
    else
      0.0
    end
  end
end
