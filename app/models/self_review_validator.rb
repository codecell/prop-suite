class SelfReviewValidator < ActiveModel::Validator
  def validate(record)
      record.errors[:base] << "You can't review yourself" if 
      record.reviewer_id == record.reviewed_id
  end
end