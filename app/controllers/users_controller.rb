class UsersController < ApplicationController
  def show
    @user = User.find_by_id(current_user.id)
  end
end
