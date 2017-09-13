module SessionHelper


def current_user
	if session[:patient_id] == nil
		return nil
	else
		return Patient.find(session[:patient_id]) 
	end
end

end