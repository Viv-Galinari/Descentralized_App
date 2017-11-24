class Bookmark < ApplicationRecord
  belongs_to :review
  belongs_to :user

  # the scope of this review should be unique for each user
  validates :review, uniqueness: { scope: :user }
end
