module RightSidebarHelper
  def rightbar_whotofollow
    usersdata = User.all.includes(:reviews, :followings).ordered_by_most_recent
    
    content_tag :ul do
      usersdata[0..9].each do |user|        
      if user != current_user && !current_user_followers.include?(user.id)
        user_item = link_to user_path(user), class: "who-to-follow-link" do
          content_tag :li, class: "who-to-follow-item" do
            if user.avatar.url.present?
              user_avatar = cl_image_tag(user.avatar.url, :width=>60, :height=>60, 
                :fetch_format=>:auto, :quality=>"auto", :use_root_path=>true,
                :class => "users-list-avatar"
              )
            else
              user_avatar = content_tag :div do
                content_tag :i, class: "fa fa-user-circle user-icon" do;end
              end
            end

            user_to_follow_details = content_tag :div, class: "who-to-follow-details" do
              user_fullnames = content_tag :p do
                content_tag(:b, "#{user.fullname}")
              end

              user_followers_count = content_tag(:small, "#{user.inverse_followings.count} followers")

              user_fullnames + user_followers_count
            end

            user_avatar + user_to_follow_details
          end
        end

        concat(user_item)
      end
     end
    end
  end
end