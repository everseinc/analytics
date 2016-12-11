class Models::CustomerValidator < ActiveModel::Validator
  def validate(customer)
    condition = Maybe.new(customer.name)
                  >> StringValidator.not_empty
                  >> StringValidator.no_blank

    customer.errors[:name] << 'name is invalid' if condition.nothing?
  end


end
