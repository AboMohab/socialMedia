class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string :title
    	t.string :author
    	t.string :body
    	t.string :user_image
    	t.references :user

      t.timestamps null: false
    end
  end
end
