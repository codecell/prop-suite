module ApartmentsHelper
  def apartment_params
    params.require(:apartment).permit(:category, :price, :address,
                                      apartment_attachments_attributes: %i[id apartment_id apartmentphoto])
  end

  # markup-structure:
  # .show-apartments >
  #   .apartmentphotos-frame > .apartment-image
  #   .apartment-unit-details >
  #       small tags >
  #           span .detail-var
  def show_apartments
    content_tag(:div, class: 'show-apartments') do
      @apartments && @apartments.each do |rental|
        photos_container = content_tag :div, class: 'apartmentphotos-frame' do
          rental.apartment_attachments.count.positive? &&
            rental.apartment_attachments[0..1].each do |pic|
              pic.apartmentphoto.url && concat(cl_image_tag(pic.apartmentphoto.url, width: 300,
                height: 100, fetch_format: :auto, quality: 'auto',
                use_root_path: true, class: 'apartment-image'))
            end
        end

        apartment_unit_details = content_tag :div, class: 'apartment-unit-details' do
          item1 = content_tag(:small) do
            content_tag(:span, "Address:  #{rental.address}", class: 'detail-var')
          end

          item2 = content_tag(:small) do
            content_tag(:span, "Category:  #{rental.category}", class: 'detail-var')
          end

          item3 = content_tag(:small) do
            content_tag(:span, "Price(£): #{rental.price}", class: 'detail-var')
          end

          item4 = content_tag(:small) do
            content_tag(:span, "Agent: #{apartment_creator(rental)}", class: 'detail-var')
          end

          item5 = content_tag(:small) do
            link_to('Details', apartment_path(rental), class: 'search-result-details-link')
          end

          item1 + item2 + item3 + item4 + item5
        end

        concat(photos_container + apartment_unit_details)
      end
    end
  end

  # structure:
  # .showpage-apartment-unit >
  #   .showpage-apartmentphotos-frame > .apartment-image
  #   .showpage-apartment-unit-details >
  #      small tags > span

  def show_selected_apartment
    content_tag :div, class: 'showpage-apartment-unit' do
      if @apartment.apartment_attachments.count.positive?
        album_container = content_tag :div, class: 'showpage-apartmentphotos-frame' do
          @apartment.apartment_attachments.each do |pic|
            concat(cl_image_tag(pic.apartmentphoto.url, width: 400, height: 100, fetch_format: :auto, quality: 'auto',
                                                        use_root_path: true, class: 'apartment-image'))
          end
        end
      end

      showpage_details = content_tag :div, class: 'showpage-apartment-unit-details' do
        item1 = content_tag(:small) do
          content_tag(:span, "Address:  #{@apartment.address}")
        end

        item2 = content_tag(:small) do
          content_tag(:span, "Category:  #{@apartment.category}")
        end

        item3 = content_tag(:small) do
          content_tag(:span, "Price(£): #{@apartment.price}")
        end

        item4 = content_tag(:small) do
          content_tag(:span, "Agent: #{apartment_creator(@apartment)}")
        end

        item5 = content_tag(:small) do
          content_tag(:span, "Phone: #{apartment_creator_contact(@apartment)}")
        end

        item6 = content_tag(:small) do
          previous_page
        end

        item1 + item2 + item3 + item4 + item5 + item6
      end

      album_container + showpage_details
    end
  end
end
