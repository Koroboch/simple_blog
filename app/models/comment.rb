class Comment < ApplicationRecord
  belongs_to :article, polymorphic: true 
  belongs_to :user, polymorphic: true

  validates :body, presence: true, length: { minimum: 4, maximum: 1000 }
end
