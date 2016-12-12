class Models::ModelValidator < ActiveModel::Validator
  def validate(customer)
    raise Fatal::MustOverrideError.code(15053)
  end

  def investigate_from(condition, symbol, records)
    raise condition.left if condition.left?

  rescue Major::ValidationError => e
    records.errors.add(symbol, e.message)
  end


end