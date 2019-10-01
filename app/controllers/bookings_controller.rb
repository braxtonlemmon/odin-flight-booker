class BookingsController < ApplicationController
	def new
		@booking = Booking.new
		@flight = Flight.find(params[:select_flight][:flight_id])
		params[:select_flight][:passengers].to_i.times do
			@booking.passengers.build
		end
	end

	def create
		@booking = Booking.new(booking_params)
		if @booking.save
			redirect_to @booking
		else
			redirect_to root_path
		end
	end

	private

	def booking_params
		params.require(:booking).permit(:flight_id,
																		passengers_attributes: [:id, :name, :email])
	end
end
