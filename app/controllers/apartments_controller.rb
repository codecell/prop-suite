class ApartmentsController < ApplicationController
  include ApartmentsHelper
  def index
    Apartment.all
  end
  
  def new
    @apartment = Apartment.new
  end

  def create
    @user = User.where(current_user.id)
    @apartment = @user.apartments.create(@apartment_params)

    if @apartment.save
      redirect_to apartment_path(apartment)
      flash[:notice] = "Apartment Successfully created"
    else
      flash.now
      render 'index'
    end
  end
end
