class AddRatingAverageToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :rating_average, :integer, default: 0,null: false
  end
end
