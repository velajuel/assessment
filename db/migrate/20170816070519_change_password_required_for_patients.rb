class ChangePasswordRequiredForPatients < ActiveRecord::Migration[5.1]
  def change
  	change_column_null :patients, :password_digest, true
  end
end
