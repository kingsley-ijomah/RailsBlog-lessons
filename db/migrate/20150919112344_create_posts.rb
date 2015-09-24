class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.boolean :publish, null: false, default: false
      t.references :moderator, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
