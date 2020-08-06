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


  def render_user_reviews
    
    if @reviews
      content_tag :div do
        @reviews.each_with_index do |val, idx|
          td4_style = ''

          if (val.rating == 'positive')
            td4_style = 'positive-review'
          elsif (val.rating == 'negative')
            td4_style = 'negative-review'
          end

          table_rows = content_tag :tr do
            td1 = content_tag(:td, "#{idx + 1}")
            td2 = content_tag(:td, "#{val.content.capitalize!}")
            td3 = content_tag(:td, "#{val.created_at.strftime("%Y/%m/%d")}")
            td4 = content_tag(:td, "#{val.rating}", class: "#{td4_style}")

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
