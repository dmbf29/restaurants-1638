class Restaurant < ApplicationRecord
  # associations
  has_many :reviews, dependent: :destroy # restaurant.reviews
  belongs_to :user
  # validations
  validates :name, presence: true, uniqueness: true
end

# dependent: :destroy
# if we delete vincent's restaurant, it will destroy all of his reviews
