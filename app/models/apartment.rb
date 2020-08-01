class Apartment < ApplicationRecord
  belongs_to :agent, foreign_key: :agent_id, class_name: 'User'
  has_many :apartment_attachments, dependent: :destroy
  accepts_nested_attributes_for :apartment_attachments, reject_if: :all_blank, :allow_destroy => true

  validates :address, presence: true, length: { 
    minimum: 5, too_short: '5 characters in address is the minimum allowed.' }
  
  validates :category, presence: true
  validates :price, presence: true
end
