class PatientsController < ApplicationController
  def show
    @patient = Patient.find(params[:id])
    puts "*" * 80
    puts @patient.prescriptions
    puts "*" * 80
  end
end
