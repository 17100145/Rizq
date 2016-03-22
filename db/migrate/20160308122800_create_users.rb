class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :cnic
      t.integer :age
      t.text :address
      t.string :organization
      t.string :designation
      t.string :firstname
      t.string :lastname
      t.string :phone

      t.timestamps null: false
    end
  end
end
