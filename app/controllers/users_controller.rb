class UsersController < ApplicationController
  include UsersHelper

  def index
    @users = User.all.includes(:reviews, :followings)
  end

  def show
    @user = User.find_by_id(params[:id])
  end
end
