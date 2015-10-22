class PlacesController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @place = Place.first
  end

  def update
    @place = Place.first
    if @place.update(place_params)
      flash[:notice] = "Die Änderungen wurden gespeichert!"
      redirect_to houses_path
    else
      flash[:notice] = "Die Änderungen konnten nicht gespeichert werden."
      render :edit
    end
  end


  private

    def place_params
      params.require(:place).permit(:id,
        countries_attributes: [:id, :name, :place_id, :_destroy,
          regions_attributes: [:id, :name, :country_id, :_destroy]
        ]
      )
    end
end
