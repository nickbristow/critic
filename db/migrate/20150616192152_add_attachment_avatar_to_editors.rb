class AddAttachmentAvatarToEditors < ActiveRecord::Migration
  def self.up
    change_table :editors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :editors, :avatar
  end
end
