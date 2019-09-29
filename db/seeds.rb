airports = ['CDG', 'ATL', 'SFO', 'NYC', 'HND', 'PEK', 'LAX', 'AMS']
airports.each { |code| Airport.create!(code: code) }


airports = Airport.all
20.times do
	from = airports.sample
	to = nil
	to = airports.sample while to.nil? || to == from 
	from.departing_flights.create!(to_airport_id: to.id)
end