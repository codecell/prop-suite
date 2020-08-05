class SelfFollowingValidator < ActiveModel::Validator
  def validate(record)
      record.errors[:base] << "You can't follow yourself" if 
      record.follower_id == record.followed_id
  end
end