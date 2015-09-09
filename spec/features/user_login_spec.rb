require 'rails_helper'

feature "User" do
  scenario "visits homepage and logs in" do
    visit root_path

    login_user

    click_on "Login with Github"

    expect(current_path).to eq dashboard_path
    expect(page).to have_content "Dashboard"
    expect(page).to have_content "Contributions"
    expect(page).to have_content "Recent Activity"
    expect(page).to have_content "Pull Requests"
  end
end
