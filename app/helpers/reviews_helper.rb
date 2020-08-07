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

    params.permit(:reviewed_id, :reviewer_id,:rating, :content)  
  end

  def render_rating_color(evaluation)
    td4_style = ''

    if (evaluation == 'positive')
      td4_style = 'positive-review'
    elsif (evaluation == 'negative')
      td4_style = 'negative-review'
    end
  end


  def render_user_reviews    
    if @reviews.count > 0
      content_tag :div do
        @reviews.each_with_index do |val, idx|

          table_rows = content_tag :tr do
            td1 = content_tag(:td, "#{idx + 1}")
            td2 = content_tag(:td, "#{val.content.capitalize!}")
            td3 = content_tag(:td, "#{val.created_at.strftime("%Y/%m/%d")}")
            td4 = content_tag(:td, "#{val.rating}", class: "#{render_rating_color(val.rating)}")

            td1 + td2 + td3 + td4
          end

          concat(table_rows)
        end 
      end
    else
      'This user has no reviews yet'
    end
  end
end
