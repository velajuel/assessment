class BookingsController < ApplicationController

def index
	end

	def new
		@doctor = Doctor.find(params[:doctor_id])
		# @booked_time = Booking.pluck(:booking_time)
		@booking = Booking.new
	end

	def create

		# "booking"=>{"patient_name"=>"asda", "treatment_service"=>"asdasd", "mobile_number"=>"asdasd", "ic_number"=>"asdasd", "booking_date"=>"25/08/2017", "booking_time"=>"14", "doctor"=>"52"}
		@booking = Booking.new(booking_params)
		if @booking.save
			# session[:notice] = "Booking is successfull"
			redirect_to confirmation_path({token: @booking.identifier_token})
		end
	end 

	private

	def booking_params
	params.require(:booking).permit(:patient_name, :treatment_service, :mobile_number, :ic_number, :booking_date, :booking_time, :doctor_id) 
	end
end


