class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :site_name
      t.integer :post_per_page, null: false, default: 20
      t.boolean :under_maintenance, null: false, default: false
      t.boolean :prevent_commenting, null: false, default: false
      t.boolean :tag_visibility, null: false, default: true
    end
  end
end
