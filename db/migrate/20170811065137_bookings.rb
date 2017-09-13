class Bookings < ActiveRecord::Migration[5.1]
   def change
    create_table :bookings do |t|
      t.string :patient_name
      t.string :treatment_service
      t.string :mobile_number
      t.string :ic_number
      t.date :booking_date
      t.string :booking_time
      t.references :doctor

      t.timestamps
    end
  end
end
