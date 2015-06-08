class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.float :score
      t.string :link
      t.references :editor

      t.timestamps null: false
    end
  end
end
