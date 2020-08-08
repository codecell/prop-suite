class Search < ApplicationRecord
  validate :no_nulls

  def apartments
    @apartments||= find_apartments
  end
  
  
  private
  
  def find_apartments
    search_data = Apartment.includes(:apartment_attachments)

    apartments = search_data.where("category like ?", "%#{category.split('')[0]}%") if category.present?
    
    address_las = address.length - 1
    apartments = search_data.where(
      "address like ?", "%#{address.split('')[0] + '%' +
    address.split('')[address_las]}%") if address.present?

    apartments = search_data.where("price >= ?", min_price) if min_price.present?
    apartments = search_data.where("price <= ?", max_price) if max_price.present?
    
    apartments if apartments.present?
  end

  def no_nulls
    if ((!min_price && !max_price && address.empty? && category.empty?) || nil?)     
      errors.add(:base, "All Search values can't be blank. At least one field is required")
    end
  end
end
