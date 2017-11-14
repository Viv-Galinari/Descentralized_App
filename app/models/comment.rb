class Comment < ApplicationRecord

  belongs_to :review

  # Add text validation to comments
  validates :body, presence: true

end
