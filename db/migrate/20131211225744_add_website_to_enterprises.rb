class AddWebsiteToEnterprises < ActiveRecord::Migration
  def change
    add_column :enterprises, :website, :string
  end
end
