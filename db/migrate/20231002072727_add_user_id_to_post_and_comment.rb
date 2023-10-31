class AddUserIdToPostAndComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :post_id

      t.timestamps
    end

    add_column :posts, :user_id, :integer
    add_column :comments, :user_id, :integer
  end
end
