class FollowingsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update delete]
  include FollowingsHelper

  def new
    @following = Following.new
  end

  def index; end

  def create
    @following = Following.new(following_params)

    if @following.save
      flash.notice = 'New following Succesfully added'
    else
      flash.alert = @following.errors.full_messages[0]
    end

    redirect_back fallback_location: 'users#show'
  end
end
