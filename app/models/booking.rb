class Booking < ApplicationRecord
	before_save :set_identifier
	belongs_to :doctor

	def set_identifier
		self.identifier_token.nil? ? self.identifier_token = SecureRandom.base64(16) : self.identifier_token
	end
end