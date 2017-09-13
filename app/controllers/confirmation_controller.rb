class ConfirmationController < ApplicationController
	
	def new
		@booking = Booking.find_by(identifier_token:params[:token])
		@doctor = @booking.doctor
	end
	


end
