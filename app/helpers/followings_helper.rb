module FollowingsHelper
  def following_params
    params.permit(:followed_id, :follower_id)
  end

  def render_follow_btn
    followers_relation = @user.inverse_followings.map do |following|
      User.all.where(id: following.follower_id).includes(:followings)
    end

    followers_array = []
    followers_relation.each do |uzer|
      followers_array << uzer[0].id
    end

    if current_user && followers_array.include?(current_user.id)
      content_tag(:p, 'following', class: 'already-following')
    else
      content_tag :div do
        render 'followings/following_form'
      end
    end
  end
end
