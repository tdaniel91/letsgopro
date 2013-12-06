class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :user_id
      t.string :name
      t.datetime :birthday_date
      t.string :city
      t.integer :phone
      t.text :quote
      t.integer :privacy

      t.timestamps
    end
  end
end
