class CreateRizqs < ActiveRecord::Migration
  def change
    create_table :rizqs do |t|
      t.string :action
      t.text :food
      t.string :quantity
      t.text :address
      t.string :area
      t.date :date
      t.time :time
      t.boolean :perishable

      t.timestamps null: false
    end
  end
end
