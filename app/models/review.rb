class Review < ApplicationRecord

  # Add an association between the Review and many comments (1-to-many relationship)
  has_many :comments
  has_many :bookmarks

  # add an association to the user
  belongs_to :user

  # Added Geocode from github
  geocoded_by :address
	after_validation :geocode

  # Validades reviews formatting
  validates :title, presence: true
  validates :body, length: { minimum: 10 }
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :restaurant, presence: true
  validates :address, presence: true

  def to_param
    id.to_s + "-" + title.parameterize
  end

end
