require 'rails_helper'

RSpec.feature "AddingComments", type: :feature do
  before do
      @john = User.create(email:"john@gmail.com",password:"password")
      @fred = User.create(email:"fred@gmail.com",password:"password")
      @article = Article.create(title:"This is a test article",body:"This is the body of my first article.",user:@john)
  end
  
  scenario "permit a signed_in user to write a review" do
      login_as(@fred)
      visit root_path
      click_link @article.title
      fill_in "New comment",with:"This article is amazing."
      click_button "Add comment"
      
      expect(page).to have_content("Comment has been created.")
      expect(page).to have_content("This article is amazing.")
      expect(page.current_path).to eq(article_path(@article))
  end
end
