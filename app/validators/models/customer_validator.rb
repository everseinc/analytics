class Models::CustomerValidator < ActiveModel::Validator
  def validate(customer)

    begin
      condition = Either.right(customer.name) >> StringValidator.not_empty >> StringValidator.no_blank
      raise condition.left if condition.left?
    rescue Major::ValidationError => e
      customer.errors.add(:name, e.message)
    end

  end


end
