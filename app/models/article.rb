class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :delete_all
 
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :text, presence: true, length: { minimum: 6, maximum: 4000 }
end
