class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { in: 2..80 }
  validates :text, presence: true, length: { maximum: 5000 }
end
