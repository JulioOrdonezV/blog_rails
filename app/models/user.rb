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
#  user_image :string
#

class User < ActiveRecord::Base
	has_many :articles, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :name, presence: true
	validates :provider, presence: true
	validates :uid, presence: true, uniqueness: { scope: [:provider] }

	def self.sign_in_from_omniauth(auth)
		find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
	end

	def self.create_user_from_omniauth(auth)
		create(
			provider: auth['provider'],
			uid: auth['uid'],
			name: auth['info']['name'],
			user_image: auth['info']['image']
			)
	end
end
