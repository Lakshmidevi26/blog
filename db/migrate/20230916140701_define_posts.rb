class DefinePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |p|
      p.string :title
      p.string :description
      p.integer :topic_id
    end
  end
end
