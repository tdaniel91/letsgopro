class AddSloganToEnterprises < ActiveRecord::Migration
  def change
    add_column :enterprises, :slogan, :string
  end
end
