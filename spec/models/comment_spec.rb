# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'rails_helper'
require 'spec_helper'

describe Comment, type: :model do
  
  before(:each) do
    @attr = { commenter: 'John Doe', body: 'nice article!' }
  end

  it "should create a new instance with valid attributes" do
    Comment.create!(@attr)
  end

  it "should require a commenter" do
    comment_without_commenter = Comment.new(@attr.merge(commenter: ""))
    expect(comment_without_commenter).to be_invalid
  end

  it "should have a body" do
    comment_without_body = Comment.new(@attr.merge(body: ""))
    expect(comment_without_body).to be_invalid
  end

  it "should not be longer than 80 chars" do
    long_body = "a" * 100
    comment_with_long_body = Comment.new(@attr.merge(body: long_body))
    expect(comment_with_long_body).to be_invalid
  end
end
