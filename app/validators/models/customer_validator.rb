class Models::CustomerValidator < Models::ModelValidator
  def validate(customer)
    condition = Either.right(customer.name) >>
                  StringValidator.not_empty >>
                  StringValidator.no_blank

    investigate_from(condition, :name, customer)

    condition = Either.right(customer.email) >>
                  StringValidator.not_empty >>
                  StringValidator.no_blank

    investigate_from(condition, :email, customer)

  end


end
