module CoverphotoZoneHelper
  def render_coverphoto
    content_tag :div, class: "image-frame" do
      link_to edit_user_registration_path do
        if @user.coverphoto.url.present?
          cl_image_tag(@user.coverphoto.url, :height=>250, :fetch_format=>:auto,
            :quality=>"auto", :use_root_path=>true, :class => "cover-photo", :alt => "cover photo"
          )
        else
          content_tag :div, class: "cover-placeholder" do
            content_tag :i, class: "fa fa-picture-o coverimage-frame-icon" do;end
          end
        end
      end
    end
  end

  def render_userpage_username
    @user.fullname
  end

  def render_userpage_fullname
    @user.username
  end

  def render_userpage_reviews_link
    link_to user_reviews_path(@user, @reviews) do
      reviews_count = content_tag(:h4, "#{@user.inverse_reviews.count}", class: "reviews-count")
      reviews_label = content_tag(:p, "Reviews")

      reviews_count + reviews_label
    end
  end

  def render_userpage_followings
    content_tag :div do
      followings_count = content_tag(:h4, "#{@user.followings.count}")
      followings_label = content_tag(:p, "Following")

      followings_count + followings_label
    end
  end

  def render_userpage_followers
    content_tag :div do
      followers_count = content_tag(:h4, "#{@user.inverse_followings.count}")
      followers_label = content_tag(:p, "Followers")

      followers_count + followers_label
    end
  end

end