class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :userid
      t.text :status

      t.timestamps null: false
    end
  end
end
