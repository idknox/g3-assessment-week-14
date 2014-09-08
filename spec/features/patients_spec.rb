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

  scenario "User can add prescriptions" do
    user = create_user
    patient = create_patient
    medication = create_medication

    login(user)
    click_on patient.first_name
    click_on "Add Prescription"

    page.select medication.name, :from => "Medication"
    fill_in "Dosage", :with => "1 pill"
    fill_in "Schedule", :with => "every 4 hours"
    fill_in "Start date", :with => "09/17/2014"
    fill_in "End date", :with => "09/18/2014"
    click_on "Create Prescription"

    expect(page).to have_content("Your prescription has been created", patient.first_name, "Tylenol", "1 pill every 4 hours", "09/17/2014 - 09/18/2014")
  end

  scenario "create script page displays errors" do
    user = create_user
    patient = create_patient
    login(user)

    click_on patient.first_name
    click_on "Add Prescription"
    click_on "Create Prescription"

    expect(page).to have_content("Your prescription could not be saved")
    expect(page).to have_content("Medication can't be blank")
    expect(page).to have_content("Dosage can't be blank")
    expect(page).to have_content("Schedule can't be blank")
    expect(page).to have_content("Start date can't be blank")
    expect(page).to have_content("End date can't be blank")
  end
end