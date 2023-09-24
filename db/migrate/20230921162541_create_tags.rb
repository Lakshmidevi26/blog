class CreateTags < ActiveRecord::Migration[7.0]
  def change
    # execute "SET statement_timeout = '20s';"
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
