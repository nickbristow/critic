class CreateUserreviews < ActiveRecord::Migration
  def change
    create_table :userreviews do |t|
      t.integer :score
      t.integer :user_id
      t.integer :game_id

      t.timestamps null: false
    end
  end
end
