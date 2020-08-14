module ApplicationHelper
  def current_user_followers
    followings_arr = current_user.followings.to_a

    follwed_ids = []
    followings_arr.each { |f| follwed_ids << f.followed_id }

    follwed_ids
  end

  def previous_page
    link_to(:back) do
      content_tag :div, class: 'prev-page-link' do
        left_arrow_icon = content_tag :i, class: 'fa fa-arrow-left' do; end

        left_arrow_icon + 'Previous page'
      end
    end
  end

  def apartment_creator(apartment)
    user = User.find_by_id(apartment.agent_id)

    user&.fullname
  end

  def apartment_creator_contact(apartment)
    user = User.find_by_id(apartment.agent_id)

    user&.phone
  end
end
