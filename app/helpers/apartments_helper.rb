module ApartmentsHelper
  def apartment_params
    params.require(:apartment).permit(:category, :price, :address,
      apartment_attachments_attributes: [:id, :apartment_id, :apartmentphoto]
    )
  end
end
