class CreateEnterprises < ActiveRecord::Migration
  def change
    create_table :enterprises do |t|
      t.string :name
      t.text :history
      t.datetime :foundation
      t.string :email
      t.integer :phone
      t.text :address
      t.text :areas
      t.text :projectos
      t.integer :admin_id

      t.timestamps
    end
  end
end
