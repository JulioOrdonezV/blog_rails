require 'rails_helper'

describe ArticlesController, type: :controller do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @attr = { title: 'Titulo de ejemplo',
              text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'}
    @article = @user.articles.create!(@attr)
  end

  describe "GET 'index'" do
    it "shows index page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET 'new'" do
    it "shows the new article form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST 'create'" do
    it "creates a new article" do
      expect {
        #the post action takes a params hash *and* a session hash!!!
        post :create, { 'article' => @article.attributes }, { 'user_id' => @user.id }
    }.to change(Article, :count).by(1)
    end

    it "redirects to the new article" do
      post :create, { 'article' => @article.attributes }, { 'user_id' => @user.id }
      expect(response).to redirect_to(Article.last)
    end
  end

  describe "GET 'edit'" do
    it "finds the article and shows edit page" do
      get :edit, id: @article.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST 'update'" do
    it "updates the article with the new title" do
      post :update, { id: @article.id,
                      article: @article.attributes.merge(title: "other") }
      current_title = Article.find(@article.id).title
      expect(current_title).to eq("other")
    end

    it "redirects to the edited article" do
      post :update, { id: @article.id,
                      article: @article.attributes.merge(title: "other") }
      expect(response).to redirect_to(@article)
    end
  end

  describe "DELETE 'destroy'" do
    it "deletes the article" do
      expect{
        delete :destroy, id: @article.id
      }.to change(Article, :count).by(-1)
    end

    it "redirects to articles" do
      delete :destroy, id: @article.id
      expect(response).to redirect_to(articles_path)
    end
  end

end
