class CreateMetaweights < ActiveRecord::Migration
  def change
    create_table :metaweights do |t|
      t.integer :user_id
      t.integer :editor_id
      t.float :weight

      t.timestamps null: false
    end
  end
end
