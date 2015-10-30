class PicturesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_house, only: [:show, :edit, :index, :create, :update, :set_default]
  respond_to :html

  def index
    @pictures = @house.pictures.order(:id)
    respond_with(@pictures)
  end
  
  def create
    @picture = @house.pictures.create(params[:picture].permit(:image))
    if @house.pictures.count == 1
      @picture.change_to_def
    end
  end
    
  def set_default
    @pic = Picture.find(params[:p])
    @pic.change_to_def
    redirect_to house_pictures_path(@house)
  end
  
  def edit
    @picture = Picture.find(params[:id])
  end	
  
  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      flash[:notice] = "Die Änderungen wurden gespeichert!"
      redirect_to house_pictures_path
    else
      flash[:notice] = "Die Änderungen konnten nicht gespeichert werden."
      redirect_to edit_house_picture_path(@house,@picture)
    end
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
      params.require(:picture).permit(:id, :name, :house_id, :image, :default_pic, :description, :_destroy)
    end
end
