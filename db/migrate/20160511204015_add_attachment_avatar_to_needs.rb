class AddAttachmentAvatarToNeeds < ActiveRecord::Migration
  def self.up
    change_table :needs do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :needs, :avatar
  end
end
