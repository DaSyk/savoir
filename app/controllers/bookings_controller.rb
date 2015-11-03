class BookingsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :edit, :update, :destroy, :new]
  before_action :set_house
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @bookings = @house.bookings
    respond_with(@house, @bookings)
  end

  def show
    respond_with(@booking)
  end

  def new
    @booking = @house.bookings.build
    respond_with(@house,@booking)
  end

  def edit
    gon.bookingdate = "#{@booking.start_date} - #{@booking.end_date}"
  end

  def change_accepted
	@booking = Booking.find(params[:b])
	@booking.change_accepted
	redirect_to house_bookings_path
  end
  
  def create
    @booking = @house.bookings.build(booking_params)
    @booking.save
    flash[:notice] = "Die Buchungsanfrage wurde erfolgreich erstellt!"
    if admin_signed_in?
      redirect_to house_bookings_path(@house)
    else
      redirect_to houses_list_path
    end
  end

  def update
    @booking.update(booking_params)
    flash[:notice] = "Die Änderungen wurden gespeichert!"
    redirect_to house_bookings_path(@house)
  end

  def destroy
    @booking.destroy
    flash[:notice] = "Die Buchung wurde erfolgreich gelöscht!"
    redirect_to house_bookings_path(@house)
  end

  private
    def set_house
      @house = House.find(params[:house_id])
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :lastname, :house_id, :accepted, :message, :phone, :gender, :email)
    end
end
