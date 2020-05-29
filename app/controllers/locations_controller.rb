class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    search = params[:search][:query]

    if search.present?
      @locations = Location.search_by_address(search)
       # applying geocoder to show addresses on map
      @locations.geocoded
      @markers = @locations.map do |location|
        {
          lat: location.latitude,
          lng: location.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { location: location })
        }
      end
    else
      @locations = Location.all
    end
  end

  def show
    @location = Location.find(params[:id])
    @booking = Booking.new
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user
    if @location.save
      redirect_to location_path(@location)
    else
      render :new
    end
  end
  #<%# form embedded %>

  private

  def location_params
    params.require(:location).permit(:name, :address, :description, :style, :daily_fee, photos: [])
  end

end
