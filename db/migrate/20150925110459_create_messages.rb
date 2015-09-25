class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.references :visitor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
