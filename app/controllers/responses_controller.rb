class ResponsesController < ApplicationController
  def create

    @booking = Booking.new(booking_params)

    @band = Band.find(params[:band_id])
    @user = current_user

    @booking.band = @band
    @booking.user = @user

    if @booking.save
      redirect_to bookings_path, notice: "Booking Created!"
    else
      render :new, status: :unprocessable_entity, notice: "Could not create booking"
    end

  end
end
