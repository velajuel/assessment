doctor = {}

doctor["password"] = "testing123"
min = [1000,2000,4000,5000]
max = [6000, 7000, 8000, 9000]

open_hour = [900, 1000,1100]
close_hour = [1800,1900,2000]

cities = ["KL", "Subang", "PJ"]

def rand_service(number)
	services = [0,1,2,3,4,5,6]
	array = []
	number.times do
		service =  services.sample
		array << service
		services.delete(service)
	end
	array
end

ActiveRecord::Base.transaction do
	50.times do
		doctor["name"] =Faker::Name.first_name
		doctor["email"] = Faker::Internet.email
		doctor["contact_information"] = Faker::Number.number(10)
		doctor["company_name"] = Faker::Company.name
		doctor["location"] = cities.sample
		doctor["registration_number"] = SecureRandom.base64(6)
		doctor["min_rate"] = min.sample
		doctor["max_rate"] = max.sample
		doctor["opening_hours"] = open_hour.sample
		doctor["closing_hours"] = close_hour.sample
		doctor["types_of_service"] = rand_service(4) 

		Doctor.create(doctor)
	end
end

