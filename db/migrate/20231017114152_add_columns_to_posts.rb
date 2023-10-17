class AddColumnsToPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :created_at
    remove_column :posts, :updated_at
    add_timestamps :posts, null: false, default: Time.zone.now
  end
end
