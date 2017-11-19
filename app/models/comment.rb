class Comment < ApplicationRecord

  # link comments to a review
  belongs_to :review

  # Add text validation to comments
  validates :body, presence: true

  # profanity filter
  profanity_filter :body


end
