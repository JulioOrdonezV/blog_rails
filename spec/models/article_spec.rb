require 'rails_helper'
require 'spec_helper'

describe Article, type: :model do

  before(:each) do
    @attr = { title: 'Titulo de ejemplo', text: 'Lorem ipsum dolor' + 
    'sit amet, consectetur adipiscing elit, sed do eiusmod tempor'}
  end

  it "should create a new instance given valid attributes" do
    Article.create!(@attr)
  end

  it "should have a title" do
    no_title_article = Article.new(@attr.merge(title: ""))
    expect(no_title_article).to be_invalid
  end

  it "should have text" do
    no_text_article = Article.new(@attr.merge(text: ""))
    expect(no_text_article).to be_invalid
  end

  it "should not have a text longer than 8000 chars" do
    long_text = "a" * 8000
    long_text_article = Article.new(@attr.merge(text: long_text))
    expect(long_text_article).to be_invalid
  end

  it "should have a title less than 80 chars" do
    long_title = "a" * 100
    long_title_article = Article.new(@attr.merge(title: long_title))
    expect(long_title_article).to be_invalid
  end

end
