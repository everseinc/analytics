class Password < ApplicationRecord
  has_secure_password #create secure password using by bcrypt
end
