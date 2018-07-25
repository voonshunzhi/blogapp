require 'rails_helper'

RSpec.feature "EditingArticles", type: :feature do
    before do
        @user = User.create(email:"voonshunzhi@gmail.com",password:"93332030")
        login_as(@user)
        @article = Article.create(title:"Title One",body:"Body of Article One.",user:@user)
    end
    scenario "A user updates the article" do
        visit root_path
        click_link @article.title
        click_link "Edit article"
        fill_in "Title",with:"Updated title"
        fill_in "Body",with:"Updated body of article"
        click_button "Update article"
        
        expect(page).to have_content("Article was successfully updated.")
        expect(page.current_path).to eq article_path(@article)
    end
    
    scenario "A user fails to update an article" do
        visit root_path
        click_link @article.title
        click_link "Edit article"
        fill_in "Title",with:""
        fill_in "Body",with:""
        click_button "Update article"
        
        expect(page).to have_content("Fail to update article.")
        expect(page.current_path).to eq (article_path(@article)) #but the article_path is the update path(PUT)
    end
end
