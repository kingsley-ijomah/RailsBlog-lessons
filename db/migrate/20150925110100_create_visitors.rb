class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :fullname
      t.string :email
      t.boolean :status, null: false, default: false

      t.timestamps null: false
    end
  end
end
