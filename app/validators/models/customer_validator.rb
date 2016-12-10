class Models::CustomerValidator < ActiveModel::Validator

  def validate(customer)
      condition = Maybe.new(customer.name) >> StringValidator.not_empty >> StringValidator.not_only_blank
      customer.errors[:name] << 'name is invalid'
  end


end