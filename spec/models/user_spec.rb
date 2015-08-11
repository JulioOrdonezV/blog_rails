require 'spec_helper'
require 'rails_helper'

describe User, type: :model do
  before(:each) do
    @attr = { provider: 'facebook', uid: '1234567', name: 'John Doe' }
  end

  it "should create a new user given valid attributes" do
    User.create!(@attr)
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(name: ''))
    expect(no_name_user).to be_invalid
  end

  it "should have a provider" do
    no_provider_user = User.new(@attr.merge(provider: ''))
    expect(no_provider_user).to be_invalid
  end

  it "should have an uid" do
    no_uid_user = User.new(@attr.merge(uid: ''))
    expect(no_uid_user).to be_invalid
  end
end
