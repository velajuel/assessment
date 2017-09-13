class AddBookingIdentifier < ActiveRecord::Migration[5.1]
  def change
  	add_column :bookings, :identifier_token, :string
  end
end
