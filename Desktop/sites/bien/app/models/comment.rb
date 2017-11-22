class Comment < ApplicationRecord

  # link comments to a review and user
  belongs_to :review
  belongs_to :user

  # Add text validation to comments
  validates :body, presence: true

  # profanity filter
  profanity_filter :body

end
