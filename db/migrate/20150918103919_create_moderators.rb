class CreateModerators < ActiveRecord::Migration
  def change
    create_table :moderators do |t|
      t.string :fullname
      t.string :username
      t.string :password

      t.timestamps null: false
    end
  end
end
