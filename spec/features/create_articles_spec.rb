require 'rails_helper'

RSpec.feature "CreateArticles", type: :feature do
  scenario "A user creates a new article" do
      #Actions :
      visit root_path                           #Visit root page
      click_link("New article")                 #Click on the create article link
      fill_in "Title",with:"Creating a blog"    #Fill in title
      fill_in "Body",with:"Lorem ipsum"         #Fill in body
      click_button "Create Article"             #Create article
      
      #Expectations:
      #Article has been created
      #articles_path
      expect(page).to have_content("Article has been created.")
      expect(page.current_path).to eq(articles_path)
  end
end
