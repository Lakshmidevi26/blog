class AddTimestampColumnsToPosts < ActiveRecord::Migration[7.0]
  def change
    change_table(:posts) { |t| t.timestamps }
  end
end
