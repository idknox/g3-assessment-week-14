class Prescription < ActiveRecord::Base
  belongs_to :patient

  validates :medication, :dosage, :schedule, :start_date, :end_date, :presence => true
end