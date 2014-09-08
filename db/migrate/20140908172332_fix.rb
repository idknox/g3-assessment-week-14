class Fix < ActiveRecord::Migration
  def change
    remove_column :prescriptions, :medication, :string
    add_column :prescriptions, :medication_name, :string
  end
end
