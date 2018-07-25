require 'rails_helper'

RSpec.feature "ShowArticles", type: :feature do
    before do
      @user = User.create(email:"voonshunzhi@gmail.com",password:"93332030")
      @user2 = User.create(email:"james@gmail.com",password:"password")
      @article = Article.create(title:"This is my first article",body:"This is the body of my first article",user:@user)
    end
    scenario "To non-signed in user,hide the edit and delete button" do
        #Action: 
        visit root_path
        click_link @article.title
        #Expectation :
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(page.current_path).to eq(article_path(@article))
        expect(page).not_to have_link("Edit article")
        expect(page).not_to have_link("Delete article")
    end
    
    scenario "To non-owner,hide the edit and delete button" do
        login_as(@user2)
        #Action: 
        visit root_path
        click_link @article.title
        #Expectation :
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(page.current_path).to eq(article_path(@article))
        expect(page).not_to have_link("Edit article")
        expect(page).not_to have_link("Delete article")
    end
    
    scenario "To owner,show the edit and delete button" do
        login_as(@user)
        #Action: 
        visit root_path
        click_link @article.title
        #Expectation :
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(page.current_path).to eq(article_path(@article))
        expect(page).to have_link("Edit article")
        expect(page).to have_link("Delete article")
    end
end
