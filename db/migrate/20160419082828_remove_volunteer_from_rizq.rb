class RemoveVolunteerFromRizq < ActiveRecord::Migration
  def change
    remove_column :rizqs, :volunteer, :string
  end
end
