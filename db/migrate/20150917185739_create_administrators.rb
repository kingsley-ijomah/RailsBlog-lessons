class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :username
      t.string :password

      t.timestamps null: false
    end
  end
end
