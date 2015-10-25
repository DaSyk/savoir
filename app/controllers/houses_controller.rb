class HousesController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :edit, :create, :update, :destroy]
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  before_action :set_dates, only: [:show]

  respond_to :html

  def index
    @houses = House.all
    respond_with(@houses)
  end

  def f_index
    @search = House.search(params[:q])
    @houses = @search.result(distinct: true)
    params.each do |key,value|
      Rails.logger.warn "Param #{key}: #{value}"
    end
  end

  def show
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
      redirect_to @house
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
    dates = []
    @house.bookings.each do |b|
      (b.start_date+1..b.end_date-1).each do |d|
        dates << d.to_s
      end
    end
    gon.dates = dates
  end

    def house_params
      params.require(:house).permit(:id, :name, :description, :region_id, :size, :n_people, :add_n_people, :htype,
	    suitability_attributes: [:id, :pets, :allergic, :family, :horse, :dog, :senior, :baby, :monteur, :nsmoker, :longtime, :disability, :house_id], 
		pricing_attributes: [:id, :n_people, :surcharge_night, :surcharge_week, :house_id, 
		  periods_attributes: [:id, :from, :to, :min, :min_type, :cost_per_night, :cost_per_week, :cost_add_night, :pricing_id, :_destroy], 
	      costs_attributes: [:id, :name, :ctype, :amount, :optional, :pricing_id, :_destroy]
		],
		pictures_attributes: [:id, :name, :house_id, :image, :_destroy],
		pictures_attributes: [:id, :house_id, :internet, :tv, :pool, :garden, :terrasse, :grill, :balcony, :washingmachine, :dishwasher, :babybed, :_destroy]
	  )
    end
end
