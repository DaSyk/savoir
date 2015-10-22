class PicturesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_house, only: [:show, :index, :create]
  respond_to :html

  def index
    @pictures = @house.pictures
    respond_with(@pictures)
  end

  def create
    @picture = @house.pictures.create(params[:picture].permit(:image))
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to house_pictures_path
  end

  private

    def set_house
      @house = House.find(params[:house_id])
    end

    def picture_params
      params.require(:picture).permit(:id, :name, :house_id, :image, :_destroy)
    end
end
