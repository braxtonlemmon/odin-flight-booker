class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :start
      t.integer :finish
      t.datetime :date
      t.float :duration

      t.timestamps
    end
  end
end
