class Doctor < ApplicationRecord
	has_secure_password
	has_many :bookings

	def types_of_services
		 transform(self.types_of_service)
	end

	def transform(array)
		array.map do | number |
			case number 
			when 0 
				"Gynea"
			when 1 
				"Check Up"
			when 2 
				"Massage"
			when 3 
				"Courses"
			when 4 
				"Lady"
			when 5 
				"Food"
			when 6 
				"Centre"
			else
				"Service does not yet exist"
			end
		end
	end
end
