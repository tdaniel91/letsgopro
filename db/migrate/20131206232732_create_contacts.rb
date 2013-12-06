class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.integer :user2_id
      t.string :state

      t.timestamps
    end
  end
end
