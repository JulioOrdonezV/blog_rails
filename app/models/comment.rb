class Comment < ActiveRecord::Base
  belongs_to :article
  validates :commenter, presence: true
  validates :body, presence: true, length: { in: 2..80 }
end
