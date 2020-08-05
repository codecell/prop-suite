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
end
