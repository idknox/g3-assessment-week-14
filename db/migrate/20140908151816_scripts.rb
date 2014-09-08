class Scripts < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.string :name
      t.integer :patient_id
      t.integer :medication_id
    end
  end
end
