class User < ActiveRecord::Base
has_many :articles

validates :name, presence: true
validates :provider, presence: true
validates :uid, presence: true

end
