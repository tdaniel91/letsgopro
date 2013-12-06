class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :image
      t.string :article_title
      t.text :article_text

      t.timestamps
    end
  end
end
