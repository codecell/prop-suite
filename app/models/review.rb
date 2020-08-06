require_relative './self_review_validator.rb'

class Review < ApplicationRecord
  enum rating: [ :neutral, :positive, :negative ]

  belongs_to :reviewer, foreign_key: :reviewer_id, class_name: 'User'
  belongs_to :reviewed, foreign_key: :reviewed_id, :class_name => "User"

  validates_with SelfReviewValidator
  validates :content, presence: true,
   length: { maximum: 200, too_long: '200 characters in comment is the maximum allowed.' }
end
