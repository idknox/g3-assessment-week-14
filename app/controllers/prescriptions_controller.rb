class PrescriptionsController < ApplicationController
  def new
    @prescription = Prescription.new
    @medications = Medication.names
  end

  def create
    @prescription = Prescription.new(prescription_params)
    flash[:notice] = "Your prescription has been created"
    redirect_to patient_path(params[:patient_id])
  end

  private

  def prescription_params
    params.require(:prescription).permit(:medication, :dosage, :schedule, :starts_on, :ends_on)
  end
end