class Password < ApplicationRecord
	extend DigestManager

  validates_with  Models::PasswordValidator
  has_secure_password #create secure password using by bcrypt


	###
  ## associaton
  #

  has_many :customers_passwords, dependent: :destroy
  has_many :customers, through: :customers_passwords


  ###
  ## class methods
  #

  class << self


    ###
    ## update
    #

    def update_passwd(passwd_params)
      passwd = self.find(passwd_params[:id])
      
      if !passwd.authenticate(passwd_params[:old_password])
      	raise Major::UpdateFailedError.code(21009)
      end
      if !passwd.update(password: passwd_params[:password], password_confirmation: passwd_params[:password_confirmation])
        raise Major::UpdateFailedError.code(21008)
      end

      passwd
    end
  end
end
