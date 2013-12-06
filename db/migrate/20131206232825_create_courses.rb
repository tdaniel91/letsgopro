class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.string :name
      t.string :univ
      t.datetime :year

      t.timestamps
    end
  end
end
