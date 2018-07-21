require 'rails_helper'

RSpec.feature "ShowArticles", type: :feature do
    before do
      @article = Article.create(title:"This is my first article",body:"This is the body of my first article")
    end
    scenario "A user shows an article" do
        #Action: 
        visit root_path
        click_link @article.title
        #Expectation :
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(page.current_path).to eq(article_path(@article))
    end
end
