module SearchesHelper
  def search_params
    params.require(:search).permit(:category, :min_price, :max_price, :address)
  end

  def print_search_result
    if @search.apartments

      content_tag(:ul, class: 'search-result-ul') do
        @search.apartments.each do |ap|
          image_wrapper = content_tag :div, class: 'search-result-img-wrapper' do
            ap.apartment_attachments.each do |pic|
              pic.apartmentphoto.url &&
                concat(image_tag(pic.apartmentphoto.url, class: 'search-page-image', alt: 'apartment photo'))
            end
          end

          l2 = content_tag(:li, "Price(£): #{ap.price}")
          l3 = content_tag(:li, "Address: #{ap.address}")
          l4 = content_tag(:li, "Category: #{ap.category}")
          l5 = link_to('Details', apartment_path(ap), class: 'search-result-details-link')

          concat(image_wrapper).concat(l2 + l3 + l4 + l5)
        end
      end
    else
      'No Results Match Your Exact Query'
    end
  end
end
