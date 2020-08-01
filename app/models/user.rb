class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  mount_uploader :coverphoto, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :apartments, foreign_key: 'agent_id', class_name: 'Apartment', dependent: :destroy

  # file size validations
  validate :avatar_size_validation
  validate :coverphoto_size_validation

  # User Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar
 
  # User Cover Photo Validation
  validates_integrity_of  :coverphoto
  validates_processing_of :coverphoto
 
  private
  def avatar_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end

  def coverphoto_size_validation
    errors[:coverphoto] << "should be less than 1000KB(1mb)" if coverphoto.size > 1.megabytes
  end
end
