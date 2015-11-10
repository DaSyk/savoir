class HousesController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :edit, :create, :update, :destroy]
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  before_action :set_dates, only: [:show]

  respond_to :html

  def index
    @houses = House.all.order(:id)
    respond_with(@houses)
  end

  def f_index
    @search = House.where(activated: true).search(params[:q])
    @houses = @search.result(distinct: true)
    params.each do |key,value|
      Rails.logger.warn "Param #{key}: #{value}"
    end
  end

  def activate
    @house = House.find(params[:h])
    @house.change_activate
    redirect_to houses_path
  end

  def show
    @hash = Gmaps4rails.build_markers(@house) do |house, marker|
      marker.lat house.latitude
      marker.lng house.longitude
    end
	@booking = @house.bookings.build
    respond_with(@house)
  end

  def edit
  end

  def create
    @house = House.new(name: "new house")
    @suitability = @house.build_suitability
    @pricing = @house.build_pricing
    @facility = @house.build_facility
    @pricing.periods.build
    @pricing.costs.build
    @house.save
    flash[:notice] = "Ein neues Haus wurde angelegt."
    redirect_to edit_house_path(@house)
  end

  def update
    if @house.update(house_params)
      flash[:notice] = "Die Änderungen wurden gespeichert!"
      redirect_to houses_path
    else
      flash[:notice] = "Die Änderungen konnten nicht gespeichert werden."
      render :edit
    end
  end

  def destroy
    @house.destroy
    flash[:notice] = "Das Haus wurde erfolgreich gelöscht!"
    respond_with(@house)
  end

  private
    def set_house
      @house = House.find(params[:id])
    end

  def set_dates
    disabled_dates = []
    @busy_dates = []
	  @closed_dates = []
	  @request_dates = []
	  @special_dates = []

	  @house.pricing.periods.where(ptype: "geschlossen").each do |p|
	    if p.from && p.to
        (p.from..p.to).each do |d|
  		    disabled_dates << d.to_s
  		    @closed_dates << d
  	    end
      end
	  end

    @house.bookings.each do |b|
      if b.start_date && b.end_date
        (b.start_date+1..b.end_date-1).each do |d|
          disabled_dates << d.to_s
          @busy_dates << d
        end
      end
    end
    gon.dates = disabled_dates

	  @house.pricing.periods.where(ptype: "auf Anfrage").each do |p|
	    if p.from && p.to
        (p.from..p.to).each do |d|
  		    @request_dates << d
  	    end
      end
	  end

	  @house.pricing.periods.where(ptype: "Sonderangebot").each do |p|
	    if p.from && p.to
        (p.from..p.to).each do |d|
  		    @special_dates << d
  	    end
      end
	  end
  end

    def house_params
      params.require(:house).permit(:id, :name, :description, :location_id, :size, :n_people, :add_n_people, :htype, :movie_url, :address, :latitude, :longitude,
	    suitability_attributes: [:id, :pets, :allergic, :family, :horse, :dog, :senior, :baby, :monteur, :nsmoker, :longtime, :disability, :house_id, :_destroy],
      facility_attributes: [:id, :internet, :tv, :pool, :garden, :terrace, :grill, :balcony, :washingmachine, :dishwasher, :babybed, :house_id, :_destroy],
		pricing_attributes: [:id, :n_people, :surcharge_night, :surcharge_week, :house_id,
		  periods_attributes: [:id, :from, :to, :min, :min_type, :cost_per_night, :cost_per_week, :season, :pricing_id, :ptype, :_destroy],
	      costs_attributes: [:id, :name, :ctype, :amount, :optional, :pricing_id, :_destroy]
		],
		pictures_attributes: [:id, :name, :house_id, :image, :_destroy],
		pictures_attributes: [:id, :house_id, :internet, :tv, :pool, :garden, :terrasse, :grill, :balcony, :washingmachine, :dishwasher, :babybed, :_destroy]
	  )
    end
end
