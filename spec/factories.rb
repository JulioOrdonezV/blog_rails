FactoryGirl.define do
  factory :user do
    name "Example User"
    provider "some_provider"
    uid  "1234567890"
    user_image "http://thecontentwrangler.com/wp-content/uploads/2011/08/User.png"
  end
end
