module UsersHelper 
  # USER SHOW PAGE RIGHTBAR
  def user_followers
    followers_array = @user.inverse_followings.map { |following| 
      User.all.where(:id => following.follower_id).includes(:followings) }
    
      content_tag :ul, class: "user-followers" do
        followers_array[0..5].each do |user|
          follower_row = link_to(user_path(user[0])) do 
            content_tag :li, class: "who-to-follow-item" do
              if user[0].avatar.url.present?
                url = user[0].avatar.url
                user_icon = content_tag(cl_image_tag(user[0].avatar, width: 50, height: 50,
                  fetch_format: :auto, quality: "auto",
                  use_root_path: true, class: "user-followers-avatar"))
              else
                user_icon = content_tag :i, class: "fas fa-user-circle user-icon" do;end
              end
    
              follower_details = content_tag :div, class: "user-followers-details" do
                follower_fullname = content_tag(:p, user[0].fullname, 
                  class: "user-followers-fullname")
                follower_followers = content_tag(:small,
                    "#{user[0].inverse_followings.count} followers",
                    class: "user-followers-fullname") 
                  
                    follower_fullname + follower_followers
              end
    
              user_icon + follower_details
            end 
          end
          
          concat(follower_row)
        end
      end 
  end

  def render_sidebar_followers
    if current_user
      content_tag :div, class: "followers-zone" do 
        followings_div = content_tag :div do
          followings_count = content_tag(:h2, "#{current_user.followings.count}")
          label_followings = content_tag(:p, "Following")

          followings_count + label_followings
        end

        followers_div = content_tag :div do
          followers_count = content_tag(:h2, "#{current_user.inverse_followings.count}")
          label_followers = content_tag(:p, "Followers")

          followers_count + label_followers
        end

        concat(followings_div + followers_div)
      end
    end
  end
end
