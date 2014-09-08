class Med < ActiveRecord::Migration
  def change
    add_column :prescriptions, :medication, :string
  end
end
