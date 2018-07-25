require 'rails_helper'

RSpec.describe "Articles", type: :request do
  before do
    @user = User.create(email:"voonshunzhi@gmail.com",password:"93332030")
    @user2 = User.create(email:"john@gmail.com",password:"93332030")
    @article = Article.create(title:"This is my first article.",body:"This is the body of my first article.",user:@user)
  end
  describe "GET /articles/:id" do
    context "with existing article" do
      before { login_as(@user);get article_path(@article)}
        it "handles existing article" do
          expect(response.status).to eq 200
        end
    end
    
    context "with non-existing article" do
      before {login_as(@user); get "/articles/xxxx"}
      it "handles non-existing article" do
        expect(response.status).to eq 302
        flash_message = "The article that you are looking for cannot be found."
        expect(flash[:danger]).to eq flash_message
      end
    end
  end
  
  describe "GET /articles/:id/edit" do
    context "with non-signed in user" do
      before { get edit_article_path(@article)}
      it "redirects to signin page" do
        expect(response.status).to eq 302
        flash_message = "You need to sign in or sign up before continuing."
        expect(flash[:alert]).to eq flash_message
      end
    end
    context "with non-owner user but signed_in"  do
      before do
        login_as(@user2)
        get edit_article_path(@article)
      end
      
      it "redirect to the home page" do
        expect(response.status).to eq 302
        flash_message = "You can only edit your own article."
        expect(flash[:danger]).to eq flash_message
      end
    end
    
    context "with signed-in and owner successfully edit" do
      before do
        login_as(@user)
        get edit_article_path(@article)
      end
      
      it "should be fine" do
        expect(response.status).to eq 200
      end
    end
  end
end
