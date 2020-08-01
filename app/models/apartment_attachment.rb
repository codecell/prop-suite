class ApartmentAttachment < ApplicationRecord
  mount_uploader :apartmentphoto, ApartmentphotoUploader

  belongs_to :apartment

  # Apartment Photo Validation
  validates :apartmentphoto, presence: true
  validate :apartmentphoto_size_validation
  validates_integrity_of  :apartmentphoto
  validates_processing_of :apartmentphoto
 
  private
  def apartmentphoto_size_validation
    errors[:apartmentphoto] << "should be less than 1000KB(1mb)" if apartmentphoto.size > 1.megabytes
  end
end
