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
end
