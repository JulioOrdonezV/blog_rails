# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'rails_helper'
require 'spec_helper'

describe Article, type: :model do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @attr = { title: 'Titulo de ejemplo', text: 'Lorem ipsum dolor' +
    'sit amet, consectetur adipiscing elit, sed do eiusmod tempor'}
  end

  it "should create a new instance given valid attributes" do
    @user.articles.create!(@attr)
  end

  it "should have a title" do
    no_title_article = @user.articles.build(@attr.merge(title: ""))
    expect(no_title_article).to be_invalid
  end

  it "should have text" do
    no_text_article = @user.articles.build(@attr.merge(text: ""))
    expect(no_text_article).to be_invalid
  end

  it "should not have a text longer than 8000 chars" do
    long_text = "a" * 8000
    long_text_article = @user.articles.build(@attr.merge(text: long_text))
    expect(long_text_article).to be_invalid
  end

  it "should have a title less than 80 chars" do
    long_title = "a" * 100
    long_title_article = @user.articles.build(@attr.merge(title: long_title))
    expect(long_title_article).to be_invalid
  end

  describe "user associations" do
    before(:each) do
      @article = @user.articles.build(@attr)
    end

    it "should have a user attribute" do
      expect(@article).to respond_to(:user)
    end

    it "should have the right user" do
      expect(@article.user_id).to eq(@user.id)
      expect(@article.user).to eq(@user)
    end
  end
end
