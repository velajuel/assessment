class SessionsController < ApplicationController

	def login
        @patient = Patient.find_by(name:params[:name]) 
        if  @patient.nil? == true || @patient.authenticate(params[:password]) == false
            redirect_to root_path
        else
            session[:patient_id] = @patient.id
            redirect_to patient_path(id: @patient.id)
        end
    end

    def logout
        
        session[:patient_id] = nil
        redirect_to root_path
    end

    def create_from_omniauth
      auth_hash = request.env["omniauth.auth"]
      authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

      # if: previously already logged in with OAuth
      if authentication.patient
        patient = authentication.patient
        authentication.update_token(auth_hash)
        @next = root_url
        @notice = "Signed in!"
      # else: patient logs in with OAuth for the first time
      else
        patient = Patient.create_with_auth_and_hash(authentication, auth_hash)
        # you are expected to have a path that leads to a page for editing patient details
        @next = edit_patient_path(patient)
        @notice = "Patient created. Please confirm or edit details"
      end

      session[:patient_id] = patient.id
      redirect_to new_doctor_booking_path(session[:doctor_booking_id]), :notice => @notice
    end

    private

    def patient_params
        params.require(:patient).permit(:name, :email, :password)
    end



end