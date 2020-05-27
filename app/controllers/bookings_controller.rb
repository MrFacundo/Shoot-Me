class BookingsController < ApplicationController
  def new
    @location = Location.find(params[:location_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @location = Location.find(params[:location_id])
    @booking.location = @location
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
        #path needs to be updated to redirect to booking show
        
    else
      render :new
    end
  end

  def index
    @user = current_user
    @bookings = @user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
