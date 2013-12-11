class AddAttachmentAttachmentToEnterprises < ActiveRecord::Migration
  def self.up
    change_table :enterprises do |t|
      t.attachment :attachment
    end
  end

  def self.down
    drop_attached_file :enterprises, :attachment
  end
end
