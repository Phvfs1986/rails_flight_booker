class CreateFlightPassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :flight_passengers do |t|
      t.belongs_to :flight, null: false, foreign_key: true
      t.belongs_to :passenger, null: false, foreign_key: true

      t.timestamps
    end
  end
end
