class CreateEditors < ActiveRecord::Migration
  def change
    create_table :editors do |t|
      t.string :name
      t.string :outlet
      t.string :bio
      t.string :image

      t.timestamps null: false
    end
  end
end
