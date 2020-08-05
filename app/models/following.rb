require_relative './self_friendship_validator.rb'

class Following < ApplicationRecord
  belongs_to :follower, foreign_key: :follower_id, :class_name => "User"
  belongs_to :followed, foreign_key: :followed_id, :class_name => "User"

  validates :follower,
   uniqueness: { scope: :followed, message: 'You are following this user already' }
  validates_with SelfFollowingValidator
end
