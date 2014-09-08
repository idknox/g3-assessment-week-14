require 'rails_helper'
require 'capybara/rails'

feature "Patients" do

  scenario "User sees all patients" do
    user = create_user
    patient = create_patient
    login(user)

    expect(page).to have_content(patient.first_name, patient.last_name)
  end

  scenario "User can click on patient's name and see their page" do
    user = create_user
    patient = create_patient
    login(user)

    click_on patient.first_name

    expect(page).to have_content(patient.first_name, patient.last_name, "Prescriptions")
  end

end