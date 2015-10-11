class CreateModerators < ActiveRecord::Migration
  def change
    create_table :moderators do |t|
      t.string :fullname
      t.string :username
      t.string :password_digest
      t.boolean :global, null: false, default: false

      t.timestamps null: false
    end
  end
end
