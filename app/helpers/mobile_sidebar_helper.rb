module MobileSidebarHelper
  def render_mobile_sidebar_currentuser_avatar
    content_tag :div, class: 'avatar-zone' do
      avatar_section = content_tag :div, class: 'avatar-frame' do
        link_to edit_user_registration_path do
          if current_user.avatar.url.present?
            cl_image_tag(current_user.avatar.url,
                         width: 96, height: 96, fetch_format: :auto, quality: 'auto', use_root_path: true,
                         class: 'current-user-avatar')
          else
            content_tag :div do
              content_tag :i, class: 'fa fa-user-circle user-icon' do; end
            end
          end
        end
      end

      user_details = content_tag :p do
        user_fullname = content_tag(:small, current_user.fullname.upcase.to_s, class: 'mobile-sidebar-fullname')
        user_username = content_tag(:small, "@#{current_user.username.downcase}", class: 'mobile-sidebar-username')

        user_fullname + content_tag(:br) + user_username
      end

      concat(avatar_section + user_details)
    end
  end

  def mobile_followers_zone
    if current_user
      content_tag :div, class: 'mobile-followers-zone' do
        owner_followings = content_tag :div do
          followings_count = content_tag(:h2, current_user.followings.count.to_s)
          followings_label = content_tag(:p, 'Following')

          followings_count + followings_label
        end

        owner_followers = content_tag :div do
          followers_count = content_tag(:h2, current_user.inverse_followings.count.to_s)
          followers_label = content_tag(:p, 'Followers')

          followers_count + followers_label
        end

        concat(owner_followings + owner_followers)
      end
    end
  end
end
