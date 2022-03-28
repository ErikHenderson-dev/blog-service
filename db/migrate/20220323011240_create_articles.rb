class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :category_id
      t.string :title
      t.string :sub_title
      t.timestamp :publication_date
      t.text :text
      t.string :author
    end
  end
end
