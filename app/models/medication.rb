class Medication < ActiveRecord::Base
  # has_many :patients, through: :prescriptions
  has_many :prescriptions
  has_many :patients, through: :prescriptions

  def self.names
    all.to_a.map {|med| med.name }
  end
end