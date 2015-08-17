# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  provider   :string
#  uid        :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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

  it "should reject duplicate uids when using same provider" do
    User.create!(@attr)
    user_with_same_uid = User.new(@attr)
    expect(user_with_same_uid).to be_invalid
  end

  it "should accept duplicate uids when provider differs" do
    User.create!(@attr)
    user_same_uid_different_provider = User.new(@attr.merge(provider: 'google'))
    expect(user_same_uid_different_provider).to be_valid
  end

end
