class Review < ApplicationRecord

validates :title, presence: true
validates :body, length: {minimum: 10}
validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
validates :restaurant, presence: true

# To change default URL pattern to SEO friendly
# Take the Id and turn them into string
# Add a dash, and turn title into URL
# the dash will remove the sapces (%20)

def to_param
 id.to_s + "-" + title.parameterize
end


end
