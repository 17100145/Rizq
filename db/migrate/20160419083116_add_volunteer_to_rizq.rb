class AddVolunteerToRizq < ActiveRecord::Migration
  def change
    add_column :rizqs, :volunteer, :string, default: nil
  end
end
