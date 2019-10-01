class FlightsController < ApplicationController
	def index
		@airports = Airport.all
		@flights = get_flights if params[:search]
	end
end
