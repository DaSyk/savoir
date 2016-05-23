class HousesController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :edit, :create, :update, :destroy]
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  before_action :set_dates, only: [:show]

  respond_to :html

  def index
    @houses = []
	Region.all.order(:name).each do |region|
		region.locations.order(:name).each do |location|
			location.houses.order(:name).each do |house|
				@houses << house
			end
		end
	end
	House.all.where(location_id: nil).each do |house|
		@houses << house
	end
    respond_with(@houses)
  end

  def f_index
    @search = House.where(activated: true).search(params[:q])
    @houses = @search.result(distinct: true)
    @locations = Location.where(id: @houses.map(&:location_id).compact.uniq).order(:name)
    @regions = Region.where(id: @locations.map(&:region_id).compact.uniq).order(houses_count: :desc)
    @countries = Country.all.order(:name)
  end

  def activate
    @house = House.find(params[:h])
    if @house.change_activate
      flash[:notice] = "#{@house.name} wurde aktiviert/deaktiviert."
    else
      flash[:error] = "#{@house.name} konnte nicht aktiviert werden."
    end
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
    gon.types = House.all.pluck(:htype)
  end

  def create
    @house = House.new(name: "new house")
    @pricing = @house.build_pricing
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
    #disabled_dates = []
    @busy_dates = []
	  @closed_dates = []
	  @request_dates = []
	  @special_dates = []
    @start_dates = []
    @end_dates = []

	  @house.pricing.periods.where(ptype: "geschlossen").each do |p|
	    if p.from && p.to
        (p.from..p.to).each do |d|
  		    #disabled_dates << d.to_s
  		    @closed_dates << d
  	    end
      end
	  end

    @house.bookings.where(accepted: true).each do |b|
      @start_dates << b.start_date if b.start_date
      @end_dates << b.end_date if b.end_date
      if b.start_date && b.end_date
        (b.start_date+1..b.end_date-1).each do |d|
          #disabled_dates << d.to_s
          @busy_dates << d
        end
      end
    end
    #gon.dates = disabled_dates

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
      params.require(:house).permit(:id, :name, :description, :location_id, :size, :n_people, :add_n_people, :htype, :movie_url, :address, :latitude, :longitude, :short_description,
	    :suit_ids => [],
      :facility_ids => [],
		pricing_attributes: [:id, :n_people, :surcharge_night, :surcharge_week, :house_id,
		  periods_attributes: [:id, :from, :to, :min, :min_type, :cost_per_night, :cost_per_week, :season, :pricing_id, :ptype, :cost_add_person, :cost_add_person_week, :_destroy],
	      costs_attributes: [:id, :name, :ctype, :amount, :optional, :pricing_id, :_destroy]
		],
		pictures_attributes: [:id, :name, :house_id, :image, :_destroy],
		pictures_attributes: [:id, :house_id, :internet, :tv, :pool, :garden, :terrasse, :grill, :balcony, :washingmachine, :dishwasher, :babybed, :_destroy]
	  )
    end
end
