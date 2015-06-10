class CreateConsolesGames < ActiveRecord::Migration
  def change
    create_table :consoles_games, id: false do |t|
      t.belongs_to :game, index: true
      t.belongs_to :console, index: true
    end
  end
end
