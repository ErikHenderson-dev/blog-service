class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :category_id
      t.string :title
      t.string :sub_title
      t.text :text
      t.string :author
      
      t.timestamps
    end
  end
end
