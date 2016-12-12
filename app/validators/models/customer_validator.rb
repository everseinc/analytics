class Models::CustomerValidator < ActiveModel::Validator
  def validate(customer)
    condition = Either.right(customer.name)
                  >> StringValidator.not_empty
                  >> StringValidator.no_blank

    customer.errors[:name] << 'name is invalid' if condition.left?
  end


end
