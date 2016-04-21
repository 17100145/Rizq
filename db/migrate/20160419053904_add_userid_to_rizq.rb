class AddUseridToRizq < ActiveRecord::Migration
  def change
    add_column :rizqs, :user_id, :string
  end
end
