class Apartment < ApplicationRecord
  belongs_to :agent, foreign_key: :agent_id, class_name: 'User'
  has_many :pictures, :as => :imageable
end
