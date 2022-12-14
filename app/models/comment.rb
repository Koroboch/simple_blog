# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :body, presence: true, length: { minimum: 4, maximum: 1000 }
end
