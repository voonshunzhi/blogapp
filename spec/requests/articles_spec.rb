require 'rails_helper'

RSpec.describe "Articles", type: :request do
  before do
    @article = Article.create(title:"This is my first article.",body:"This is the body of my first article.")
  end
  describe "GET /articles/:id" do
    context "with existing article" do
      before { get article_path(@article)}
        it "handles existing article" do
          expect(response.status).to eq 200
        end
    end
    
    context "with non-existing article" do
      before { get "/articles/xxxx"}
      it "handles non-existing article" do
        expect(response.status).to eq 302
        flash_message = "The article that you are looking for cannot be found."
        expect(flash[:danger]).to eq flash_message
      end
    end
  end
end
