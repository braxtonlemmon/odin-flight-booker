airports = ['CDG', 'ATL', 'SFO', 'NYC', 'PEK', 'LAX', 'AMS']
airports.each { |code| Airport.create!(code: code) }


airports = Airport.all
80.times do
	from = airports.sample
	to = nil
	to = airports.sample while to.nil? || to == from 
	from.departing_flights.create!(to_airport_id: to.id, date: rand(20).days.from_now)
end