class PrescriptionsController < ApplicationController
  def new
    @prescription = Prescription.new
    @medications = Medication.names
  end

  def create
    @prescription = Prescription.new(
      medication_name: params[:prescription][:medication_name],
      dosage: params[:prescription][:dosage],
      schedule: params[:prescription][:schedule],
      start_date: params[:prescription][:start_date],
      end_date: params[:prescription][:end_date],
      patient_id: params[:patient_id],
      medication_id: Medication.where(:name => params[:prescription][:medication_name])[0].id
    )

    if @prescription.save
      flash[:notice] = "Your prescription has been created"
      redirect_to patient_path(params[:patient_id])
    else
      @medications = Medication.names
      render :new
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(:medication, :dosage, :schedule, :start_date, :end_date, :patient_id, :medication_id)
  end
end