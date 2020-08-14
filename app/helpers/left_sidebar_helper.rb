module LeftSidebarHelper
  def render_currentuser_avatar_link
    link_to edit_user_registration_path, class: 'sidebar-icon-link' do
      content_tag :div, class: 'avatar-frame' do
        if current_user && current_user.avatar.url.present?
          cl_image_tag(current_user.avatar.url, width: 96, height: 96,
           fetch_format: :auto, quality: 'auto', use_root_path: true,
           class: 'current-user-avatar')
        else
          content_tag :div do
            content_tag :i, class: 'fa fa-user-circle user-icon' do; end
          end
        end
      end
    end
  end

  def render_current_usernames
    content_tag :div, class: 'sidebar-current-user' do
      if current_user
        full_name = content_tag :p do
          current_user.fullname.upcase
        end

        user_name = content_tag :small, class: 'sidebar-username' do
          '@' + current_user.username.downcase
        end

        full_name + user_name
      end
    end
  end

  def render_dashboard_link
    if current_user
      link_to(user_path(current_user)) do
        content_tag :li do
          dashboard_icon = content_tag :i, class: 'fa fa-dashboard dashboard-icon' do; end

          dashboard_icon + 'Dashboard'
        end
      end
    end
  end

  def render_home_link
    link_to(apartments_path) do
      content_tag :li do
        home_icon = content_tag :i, class: 'fas fa-home' do; end

        home_icon + 'Home'
      end
    end
  end

  def render_who_to_follow_link
    link_to(users_path) do
      content_tag :li do
        users_icon = content_tag :i, class: 'fa fa-users' do; end

        users_icon + 'Who to follow ?'
      end
    end
  end

  def render_profile_link
    if current_user
      link_to(edit_user_registration_path) do
        content_tag :li do
          profile_icon = content_tag :i, class: 'fas fa-user sidebar-user-icon' do; end

          profile_icon + 'Profile'
        end
      end
    end
  end

  def render_logout_link
    if current_user
      link_to(destroy_user_session_path, method: :delete) do
        content_tag :li do
          logout_icon = content_tag :i, class: 'fa fa-times' do; end

          logout_icon + 'Logout'
        end
      end
    end
  end
end
