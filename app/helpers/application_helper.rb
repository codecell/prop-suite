module ApplicationHelper
  def render_flash_messages
    if notice
      content_tag :div, class: 'alert-success' do
        content_tag(:p, notice)
      end
    elsif alert
      content_tag :div, class: 'alert-danger' do
        content_tag(:p, alert)
      end
    end
  end

  def current_user_followers
    followings_arr = current_user.followings.to_a if current_user

    followed_ids = []
    current_user && followings_arr.each { |f| followed_ids << f.followed_id }

    followed_ids
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
