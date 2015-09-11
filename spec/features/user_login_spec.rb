require 'rails_helper'

feature "User", :vcr do
  scenario "visits homepage and logs in" do
    visit root_path

    login_user

    click_on "Login with Github"
    expect(current_path).to eq dashboard_path
    expect(page).to have_content "Dashboard"
    expect(page).to have_content "Michael Reeves"
    expect(page).to have_content "michael-reeves"
    expect(page).to have_content "Conseguir"
    expect(page).to have_content "http://conseguir.us/"
    expect(page).to have_content "Contributions"
    expect(page).to have_content "Recent Activity"
    expect(page).to have_content "Pull Requests"

    click_on "Logout"
    expect(page).to have_content "Welcome to OctoKitty"
    expect(page).to have_content "Login with Github"
  end
end
