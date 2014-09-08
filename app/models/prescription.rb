class Prescription < ActiveRecord::Base
  belongs_to :patient
  belongs_to :medication

  validates :medication, :dosage, :schedule, :start_date, :end_date, :patient_id, :medication_id, :presence => true
  validate :dosage_must_start_with_number
  validate :start_date_must_be_before_end_date

  def dosage_must_start_with_number
    unless dosage.split(" ")[0] =~ /\A[-+]?[0-9]+\z/
      errors.add(:dosage, "must start with number")
    end
  end

  def start_date_must_be_before_end_date
    unless end_date > start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

end