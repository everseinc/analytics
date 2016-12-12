class Models::CustomerValidator < Models::ModelValidator
  def validate(customer)
    condition = Either.right(customer.name) >>
                  StringValidator.not_empty >>
                  StringValidator.no_blank >>
                  StringValidator.length_under(50)


    investigate_from(condition, :name, customer)

    condition = Either.right(customer.email) >>
                  StringValidator.not_empty >>
                  StringValidator.no_blank >>
                  StringValidator.length_under(255) >>
                  StringValidator.email_format >>
                  Models::ModelValidator.unique(customer.id, Customer, "email")



    investigate_from(condition, :email, customer)

  end


end
