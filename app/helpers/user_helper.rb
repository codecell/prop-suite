module UserHelper
  def render_onwner_heading
    if @user == current_user
      content_tag(
        :h2, 'My Apartment Postings',
        class: 'owner-apartments-heading'
      )
    else
      content_tag(
        :h2, "#{@user.fullname.capitalize!}'s Apartment Postings",
        class: 'owner-apartments-heading'
      )
    end
  end

  def render_no_apartments_info(apartments_arr)
    if @user != current_user && !apartments_arr.count.positive?
      content_tag(
        :h2, "#{@user.fullname.capitalize!} has no apartment postings yet",
        class: 'no-apartments-yet owner-apartments-heading'
      )
    elsif @user == current_user && !apartments_arr.count.positive?
      content_tag :div, class: 'no-apartments-yet' do
        content_tag(:h2, 'You have no apartment postings yet', class: 'owner-apartments-heading')
      end
    end
  end

  def render_apartment_details(rental)
    content_tag :div, class: 'apartment-unit-details' do
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
  end

  def render_owner_apartments
    my_apartments = Apartment.all.where(agent_id: @user.id)

    if my_apartments.count.positive?
      content_tag :div, class: 'current-user-aparments' do
        heading = render_onwner_heading

        apartments_list = content_tag :div do
          my_apartments.each do |rental|
            photos_container = content_tag :div, class: 'apartmentphotos-frame' do
              rental.apartment_attachments.count.positive? &&
                rental.apartment_attachments[0..1].each do |pic|
                  pic.apartmentphoto.url && concat(cl_image_tag(pic.apartmentphoto.url, width: 300,
                    height: 100, fetch_format: :auto, quality: 'auto',
                    use_root_path: true, class: 'apartment-image'))
                end
            end

            apartment_details = render_apartment_details(rental)

            concat(photos_container + apartment_details)
          end
        end
        concat(heading + apartments_list)
      end
    else
      render_no_apartments_info(my_apartments)
    end
  end
end
