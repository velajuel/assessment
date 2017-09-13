class Patient < ApplicationRecord
	has_secure_password
    has_many :authentications, dependent: :destroy

    def self.create_with_auth_and_hash(authentication, auth_hash)
      patient = self.create!(
        name: auth_hash["name"],
        email: auth_hash["extra"]["raw_info"]["email"],
        password: SecureRandom.base64(7)
      )
      patient.authentications << authentication
      return patient
    end

    # grab fb_token to access Facebook for patient data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end
 end


 
