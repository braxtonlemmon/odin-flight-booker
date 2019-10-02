module FlightsHelper
	def get_flights
		Flight.where('from_airport_id = ? and to_airport_id = ?',
			params[:search][:from_code], params[:search][:to_code])
	end

	def announce_flight_results
		if @flights.empty?
			"No flights found. Search again."
		else 
			pluralize(@flights.count, 'flight') + " found. Select one."
		end
	end
end
