class CreateAdminstrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :fullname
      t.string :username
      t.string :password

      t.timestamps null: false
    end
  end
end
