class AddAttachmentBoxartToGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.attachment :boxart
    end
  end

  def self.down
    remove_attachment :games, :boxart
  end
end
