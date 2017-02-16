class Models::PasswordValidator < Models::ModelValidator
  def validate(password)
    condition = Either.right(password.password) >>
                  StringValidator.not_empty >>
                  StringValidator.no_blank >>
                  StringValidator.length_above(6)


    investigate_from(condition, :password, password)

    condition = Either.right(password.password_confirmation) >>
                  StringValidator.not_empty >>
                  StringValidator.no_blank >>
                  StringValidator.length_above(6)



    investigate_from(condition, :password_confirmation, password)

  end


end