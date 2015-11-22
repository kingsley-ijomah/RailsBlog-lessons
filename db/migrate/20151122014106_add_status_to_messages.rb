class AddStatusToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :status, :boolean, null: false, default: false
  end
end
