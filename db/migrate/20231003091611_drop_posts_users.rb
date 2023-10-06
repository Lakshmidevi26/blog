class DropPostsUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :posts_users
  end
end
