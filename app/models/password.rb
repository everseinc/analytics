class Password < ApplicationRecord
  validates_with  Models::PasswordValidator
  has_secure_password #create secure password using by bcrypt
end
