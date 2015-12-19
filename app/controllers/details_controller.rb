class DetailsController < ApplicationController
    before_action :authenticate_admin!

  def edit
    @detail = Detail.first
  end

  def update
    @detail = Detail.first
    if @detail.update(detail_params)
      flash[:notice] = "Die Änderungen wurden gespeichert!"
      redirect_to houses_path
    else
      flash[:notice] = "Die Änderungen konnten nicht gespeichert werden."
      render :edit
    end
  end


  private

    def detail_params
      params.require(:detail).permit(:id,
        suits_attributes: [:id, :name, :activated, :_destroy],
        facilities_attributes: [:id, :name, :activated, :_destroy]
      )
    end
end
