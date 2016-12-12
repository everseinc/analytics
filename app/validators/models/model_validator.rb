class Models::ModelValidator < ActiveModel::Validator
  def validate(customer)
    raise Fatal::MustOverrideError.code(15053)
  end

  def investigate_from(condition, symbol, records)
    raise condition.left if condition.left?

  rescue Major::ValidationError => e
    records.errors.add(symbol, e.message)
  end

  def self.unique(record_id, model, attr)
    condition = -> (string){
      if model.exists?(["#{attr} = ?", string])
        record_id == model.find_by(email: string).id
      else
        return true
      end
    }
    BaseValidator.either_validate(21005, &condition)
  end

end