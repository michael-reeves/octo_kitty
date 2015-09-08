require 'rails_helper'

feature "User" do
  scenario "visits homepage and logs in" do
    visit root_path

    login_user

    click_on "Login with Github"
  end
end
