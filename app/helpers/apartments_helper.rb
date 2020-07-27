module ApartmentsHelper
  def apartment_params
    params.require(:apartment).permit(:category, :price, :photos, :address)
  end
end
