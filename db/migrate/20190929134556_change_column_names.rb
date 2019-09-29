class ChangeColumnNames < ActiveRecord::Migration[5.2]
	def change
		rename_column :flights, :start,  :from_airport_id
		rename_column :flights, :finish, :to_airport_id
  end
end
