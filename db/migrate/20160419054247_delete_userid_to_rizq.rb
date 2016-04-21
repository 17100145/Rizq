class DeleteUseridToRizq < ActiveRecord::Migration
  def change
    remove_column :rizqs, :user_id
  end
end
