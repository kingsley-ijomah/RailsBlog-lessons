class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.boolean :status, null: false, default: false

      t.timestamps null: false
    end
  end
end
