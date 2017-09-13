class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|

    	t.string :name
      	t.string :email
      	t.string :password_digest
        t.string :contact_information
      	t.string :company_name
      	t.string :location
      	t.string :registration_number
      	t.integer :min_rate
      	t.integer :max_rate
      	t.integer :opening_hours
        t.integer :closing_hours
        t.json :types_of_service


      t.timestamps
    end
  end
end
