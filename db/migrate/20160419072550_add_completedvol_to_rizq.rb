class AddCompletedvolToRizq < ActiveRecord::Migration
  def change
    add_column :rizqs, :completed, :Boolean, default: false
    add_column :rizqs, :volunteer, :string, default: ''
  end
end
