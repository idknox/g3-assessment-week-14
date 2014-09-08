class AddToScript < ActiveRecord::Migration
  def change
    add_column :prescriptions, :dosage, :string
    add_column :prescriptions, :schedule, :string
    add_column :prescriptions, :starts_on, :date
    add_column :prescriptions, :ends_on, :date
  end
end
