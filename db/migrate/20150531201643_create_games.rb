class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.date :releasedate
      t.string :boxart

      t.timestamps null: false
    end
  end
end
