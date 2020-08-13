class Search < ApplicationRecord
  validate :no_nulls

  def apartments
    @apartments ||= find_apartments
  end

  private

  def find_apartments
    search_data = Apartment.all.includes(:apartment_attachments)

    results_a = search_data.where('category like ?', "#{category[0]}%") if category.present?

    address_last_index = address.length - 1
    if address.present?
      val_a = address[0]
      val_b = address[address_last_index]

      results_b = search_data.where(
        'address like ?', "%#{val_a + '%' + val_b}%"
      )
    end

    results_c = search_data.where('price >= ?', min_price) if min_price.present?
    results_d = search_data.where('price <= ?', max_price) if max_price.present?

    results_a || results_b || results_c || results_d
  end

  def no_nulls
    if !min_price && !max_price && address.empty? && category.empty?
      errors.add(:base, "All Search values can't be blank. At least one field is required")
    end
  end
end
