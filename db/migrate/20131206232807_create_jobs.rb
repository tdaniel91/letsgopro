class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.integer :enterprise_id
      t.string :role
      t.datetime :begin
      t.datetime :end

      t.timestamps
    end
  end
end
