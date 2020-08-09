class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  mount_uploader :coverphoto, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :apartments, foreign_key: 'agent_id', class_name: 'Apartment', dependent: :destroy

  # Followings associatons
  # followings initiated by
  has_many :followings, dependent: :destroy, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followers, through: :followings, source: :follower

  # followings initiated by other users
  has_many :inverse_followings, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followeds, through: :followings, source: :followed

  # Reviews
  has_many :reviews, class_name: 'Review', foreign_key: 'reviewer_id'
  has_many :reviewers, through: :reviews, source: :reviewer

  # Reviews created by other users
  has_many :inverse_reviews, class_name: 'Review', foreign_key: 'reviewed_id'
  has_many :revieweds, through: :reviews, source: :reviewed
  accepts_nested_attributes_for :reviews, reject_if: :all_blank, allow_destroy: true

  # file size validations
  validate :avatar_size_validation
  validate :coverphoto_size_validation

  # User Avatar Validation
  validates_integrity_of :avatar
  validates_processing_of :avatar

  # User Cover Photo Validation
  validates_integrity_of :coverphoto
  validates_processing_of :coverphoto

  private

  def avatar_size_validation
    errors[:avatar] << 'should be less than 1000KB(1mb)' if avatar.size > 1.megabytes
  end

  def coverphoto_size_validation
    errors[:coverphoto] << 'should be less than 1000KB(1mb)' if coverphoto.size > 1.megabytes
  end
end
