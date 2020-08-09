class ReviewsController < ApplicationController
  include ReviewsHelper
  before_action :authenticate_user!, only: %i[new edit create update delete]

  def index
    @user = User.find_by_id(params[:user_id])
    @reviews = @user.inverse_reviews.ordered_by_most_recent
  end

  def new
    @user = User.find_by_id(params[:user_id])
    @review = current_user.reviews.new(review_params)
  end

  def create
    @review = current_user.reviews.build(review_params)

    if @review.save
      flash.notice = 'Thanks!, feedback successfully added'
    else
      flash.alert = @review.errors.full_messages[0]
    end

    redirect_back fallback_location: reviews_path(@user)
  end

  def show; end
end
