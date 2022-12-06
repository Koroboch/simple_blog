class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  has_many :comments, as: :commentable

  validates :username, presence: true, length: { minimum: 4, maximum: 100 }
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :text, presence: true, length: { minimum: 6, maximum: 4000 }
end
