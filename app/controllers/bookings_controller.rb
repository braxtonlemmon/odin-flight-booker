class BookingsController < ApplicationController
	before_action :verify_flight_selected, only: :new
	# before_action :verify_passenger_info, only: :create

	def new
		# @booking = Booking.new
		@flight = Flight.find(params[:booking][:flight_id])
		@booking = @flight.bookings.new(booking_params)
		params[:booking][:passengers].to_i.times { @booking.passengers.build }
		# if params[:booking][:flight_id]
		# 	@booking = Booking.new
		# 	@flight = Flight.find(params[:booking][:flight_id])
		# 	params[:booking][:passengers].to_i.times { @booking.passengers.build }
		# else
		# 	flash[:danger] = 'You must select a flight!'
		# 	redirect_to root_url
		# end
	end

	def create
		@flight = Flight.find(params[:booking][:flight_id])
		@booking = @flight.bookings.new(booking_params)

		if @booking.save
			flash[:success] = 'Your flight has been booked!'
			redirect_to @booking
		else
			flash.now[:success] = 'Please fill out passenger details.'
			puts 'no no'
			render 'new'
		end
	end

	def show
		@booking = Booking.find(params[:id])
		@flight = Flight.find(@booking.flight_id)
		@from = Airport.find(@flight.from_airport_id)
		@to = Airport.find(@flight.to_airport_id)
	end

	private

	def booking_params
		params.require(:booking).permit(:flight_id,
																		passengers_attributes: [:id, :name, :email])
	end

	def verify_flight_selected
		unless params[:booking][:flight_id]
			flash[:warning] = 'You did not select a flight!'
			redirect_to root_path
		end
	end

	# def verify_passenger_info
	# 	params[:booking][:passengers].to_i.times do |i|
			
	# 	unless @booking.passengers.all? { |passenger| passenger.valid? }
	# 		flash.now[:danger] = 'Please fill out all passenger info'
	# 		render 'new'
	# 	end
	# end
end
