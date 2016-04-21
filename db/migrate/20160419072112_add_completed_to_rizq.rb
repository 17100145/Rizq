class AddCompletedToRizq < ActiveRecord::Migration
  def change
    add_column :rizqs, :completed, :Boolean
    add_column :rizqs, :volunteer, :integer
  end
end
