class RemoveCompletedToRizq < ActiveRecord::Migration
  def change
    remove_column :rizqs, :completed
    remove_column :rizqs, :volunteer
  end
end
