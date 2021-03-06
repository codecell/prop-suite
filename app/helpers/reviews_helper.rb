module ReviewsHelper
  def review_params
    reviewid = params[:reviewed_id]
    reviewerid = params[:reviewer_id]
    rating = params[:review][:rating]
    content = params[:review][:content]

    params = ActionController::Parameters.new({
                                                reviewed_id: reviewid,
                                                reviewer_id: reviewerid,
                                                rating: rating,
                                                content: content
                                              })

    params.permit(:reviewed_id, :reviewer_id, :rating, :content)
  end

  def render_reviewed_user_fullnames
    @user.fullname.capitalize!
  end

  def render_rating_color(evaluation)
    if evaluation == 'positive'
      'positive-review'
    elsif evaluation == 'negative'
      'negative-review'
    end
  end

  def render_reviewer(reviewer_id)
    reviewer = User.find_by_id(reviewer_id)

    content_tag :li, class: 'who-to-follow-item' do
      user_icon = if reviewer.avatar.url.present?
                    content_tag :div do
                      cl_image_tag(reviewer.avatar.url,
                                   width: 60, height: 60, fetch_format: :auto, quality: 'auto',
                                   use_root_path: true, class: 'users-list-avatar')
                    end
                  else
                    content_tag :div do
                      content_tag :i, class: 'fa fa-user-circle user-icon' do; end
                    end
                  end

      reviewer_fullname = content_tag :div, class: 'who-to-follow-details' do
        content_tag :p do
          content_tag(:strong, reviewer.fullname.to_s)
        end
      end

      user_icon + reviewer_fullname
    end
  end

  def render_user_reviews
    if @reviews.count.positive?
      content_tag :div do
        @reviews.each_with_index do |val, idx|
          table_rows = content_tag :tr do
            td1 = content_tag(:td, (idx + 1).to_s)
            tdx = content_tag(:td, render_reviewer(val.reviewer_id))
            td2 = content_tag(:td, val.content.capitalize!.to_s)
            td3 = content_tag(:td, val.created_at.strftime('%Y/%m/%d').to_s)
            td4 = content_tag(:td, val.rating.to_s, class: render_rating_color(val.rating).to_s)

            td1 + tdx + td2 + td3 + td4
          end

          concat(table_rows)
        end
      end
    else
      'This user has no reviews yet'
    end
  end
end
