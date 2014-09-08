class FixDates < ActiveRecord::Migration
  def change
    remove_column :prescriptions, :starts_on, :date
    remove_column :prescriptions, :ends_on, :date
    add_column :prescriptions, :start_date, :date
    add_column :prescriptions, :end_date, :date
  end
end
