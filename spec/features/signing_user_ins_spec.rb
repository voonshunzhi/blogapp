require 'rails_helper'

RSpec.feature "SigningUserIns", type: :feature do
  before do
    @user = User.new(email:"hello@gmail.com",password:"password")
    @user.save
  end
  scenario "A user can sign in" do
    visit root_path
    click_link "Log In"
    fill_in "Email",with:"hello@gmail.com"
    fill_in "Password",with:"password"
    click_button "Log in"
    
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@user.email}")
    expect(page).not_to have_link("Log In")
  end
end
