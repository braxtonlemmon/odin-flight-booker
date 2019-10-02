airports = ['CDG', 'ATL', 'SFO', 'NYC']
time_zone = { CDG: 'Europe/Paris',
	SFO: 'Pacific Time (US & Canada)',
	ATL: 'Eastern Time (US & Canada)',
	NYC: 'Eastern Time (US & Canada)'
}

airports.each { |code| Airport.create!(code: code,
																			 time_zone: time_zone[code.to_sym]) }

duration = { CDG: { ATL: 33900, SFO: 41100, NYC: 30000 },
						 ATL: { CDG: 30000, SFO: 18900, NYC: 8100  },
             SFO: { CDG: 39000, ATL: 16500, NYC: 19800 },
             NYC: { CDG: 26100, ATL: 9000,  SFO: 23100 }
           }



airports = Airport.all
50.times do
	from = airports.sample
	to = nil
	to = airports.sample while to.nil? || to == from 
	from.departing_flights.create!(to_airport_id: to.id, 
																 date: rand(20).days.from_now.in_time_zone(from.time_zone) + rand(50000),
																 duration: duration[from.code.to_sym][to.code.to_sym],
																 )
end