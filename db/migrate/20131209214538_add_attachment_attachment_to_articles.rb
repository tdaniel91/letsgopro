class AddAttachmentAttachmentToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :attachment
    end
  end

  def self.down
    drop_attached_file :articles, :attachment
  end
end
