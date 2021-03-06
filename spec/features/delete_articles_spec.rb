require 'rails_helper'

RSpec.feature "DeleteArticles", type: :feature do
    before do
      @user = User.create(email:"voonshunzhi@gmail.com",password:"93332030")
      login_as(@user)
      @article = Article.create(title:"This article is going to be deleted.",body:"This content will be deleted later.",user:@user)
      @count = Article.count
    end
    scenario "A user deletes an article" do
      visit root_path
      click_link @article.title
      click_link "Delete"
      
      expect(page).to have_content "The article was successfully deleted."
      expect(page.current_path).to eq articles_path
      expect(Article.count).to eq (@count - 1)
    end
end
