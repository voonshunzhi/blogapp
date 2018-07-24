require 'rails_helper'

RSpec.feature "UserSignOuts", type: :feature do
  before do
      User.create!(email:"voonshunzhi@gmail.com",password:"93332030")
      visit root_path
      click_link "Log In"
      fill_in "Email",with:"voonshunzhi@gmail.com"
      fill_in "Password",with:"93332030"
      click_button "Log in"
  end
  
  scenario "A user signs out" do
      visit root_path
      click_link "Signout"
      expect(page).to have_content("Signed out successfully.")
      expect(page).not_to have_content("Signout")
  end
end
