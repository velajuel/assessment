class WelcomeController < ApplicationController


def index
	end
	
def search
	@doctors = Doctor.all.where(location: params["search"]["location"]).select{|doctor| doctor.types_of_services.include?(params["search"]["option"])}
end
end