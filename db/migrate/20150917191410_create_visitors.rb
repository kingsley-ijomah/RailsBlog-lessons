class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :full_name
      t.string :email
      t.boolean :status

      t.timestamps null: false
    end
  end
end
