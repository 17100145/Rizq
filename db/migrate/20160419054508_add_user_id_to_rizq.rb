class AddUserIdToRizq < ActiveRecord::Migration
  def change
    add_column :rizqs, :user_id, :integer
  end
end
