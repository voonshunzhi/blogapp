require 'rails_helper'

RSpec.feature "ListingArticles", type: :feature do
  before do
      @user = User.create(email:"voonshunzhi@gmail.com",password:"93332030")
      @article1 = Article.create(title:"This is my first article",body:"This is the body of my first article",user:@user)
      @article2 = Article.create(title:"This is my second article",body:"This is the body of my first article",user:@user)
  end
  
  scenario "with articles created and user not signed in" do
      visit root_path
      expect(page).to have_content(@article1.title)
      expect(page).to have_content(@article1.body)
      expect(page).to have_content(@article2.title)
      expect(page).to have_content(@article2.body)
      expect(page).to have_link(@article1.title)
      expect(page).to have_link(@article2.title)
      expect(page).not_to have_link("New article")
  end
  
  # scenario "A user lists all articles" do
  #     visit root_path
  #     expect(page).to have_content(@article1.title)
  #     expect(page).to have_content(@article1.body)
  #     expect(page).to have_content(@article2.title)
  #     expect(page).to have_content(@article2.body)
  #     expect(page).to have_link(@article1.title)
  #     expect(page).to have_link(@article2.title)
  # end
  
  # scenario "A user has no article" do
  #     Article.delete_all
  #     visit root_path
  #     expect(page).not_to have_content(@article1.title)
  #     expect(page).not_to have_content(@article1.body)
  #     expect(page).not_to have_content(@article2.title)
  #     expect(page).not_to have_content(@article2.body)
  #     expect(page).not_to have_link(@article1.title)
  #     expect(page).not_to have_link(@article2.title)
      
  #     within('h1#no-articles') do
  #         expect(page).to have_text('No articles created.')
  #     end
  # end
end
