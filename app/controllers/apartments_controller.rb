class ApartmentsController < ApplicationController
  include ApartmentsHelper
  before_action :authenticate_user!, only: %i[new edit create update delete]

  def index
    @apartments = Apartment.all.ordered_by_most_recent.includes(:apartment_attachments)
  end

  def new
    @apartment = Apartment.new
    @apartment_attachment = @apartment.apartment_attachments
  end

  def create
    @apartment = current_user.apartments.create(apartment_params)

    respond_to do |format|
      if @apartment.save
        params[:apartment_attachments]['apartmentphoto'].each do |pic|
          @apartment_attachment = @apartment.apartment_attachments.create!(
            apartmentphoto: pic,
            apartment_id: @apartment.id
          )
        end
        format.html do
          redirect_to apartment_path(@apartment),
                      notice: 'Apartment was Successfully created'
        end

      else
        flash.alert = @apartment.errors.full_messages[0]
        format.html { render 'index' }
      end
    end
  end

  def show
    @apartment = Apartment.find_by_id(params[:id])
    @apartment_attachments = @apartment.apartment_attachments.all
  end
end
