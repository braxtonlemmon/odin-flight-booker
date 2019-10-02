class Flight < ApplicationRecord
	belongs_to :from_airport, foreign_key: :from_airport_id, class_name: 'Airport'
	belongs_to :to_airport,   foreign_key: :to_airport_id,   class_name: 'Airport'
	has_many :bookings
	has_many :passengers, through: :bookings

	validates :from_airport_id, presence: true
	validates :to_airport_id,   presence: true
	validates :date,            presence: true
	
	def date_formatted
		date.strftime("%m/%d/%Y")
	end 

	def departure_time
		date.in_time_zone(from_airport.time_zone).strftime("%b %e, %Y at %H:%M")
	end

	def arrival_time
		arrival = date.in_time_zone(to_airport.time_zone) + duration
		arrival.strftime("%b %e, %Y at %H:%M")
	end
end
