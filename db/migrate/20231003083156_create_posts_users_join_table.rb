class CreatePostsUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :posts, :users
  end
end
