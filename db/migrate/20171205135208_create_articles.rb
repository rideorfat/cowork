class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :summary
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end