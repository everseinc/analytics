class Password < ApplicationRecord
  validates_with  Models::PasswordValidator
  has_secure_password #create secure password using by bcrypt


	###
  ## associaton
  #

  has_many :customers_passwords, dependent: :destroy
  has_many :customers, through: :customers_passwords
end
