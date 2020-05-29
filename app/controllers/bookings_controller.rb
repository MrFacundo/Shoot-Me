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
    @booking.total_price = t_price(@booking)
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
    @location = @booking.location
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  def edit
    @booking = Booking.find(params[:id])
    @location = @booking.location
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    @booking.total_price = t_price(@booking)
    @booking.save
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def t_price(booking)
    total = (@booking.end_date - @booking.start_date).to_i * @booking.location.daily_fee
    total
  end
end
