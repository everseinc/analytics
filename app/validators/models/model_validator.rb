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
    condition = -> (string) {
      if record_id
        is_exist = model.where(["#{attr} = ?", string]).where(["id != ?", record_id]).exists?
      else
        is_exist = model.where(["#{attr} = ?", string]).exists?
      end
      !is_exist
    }

    BaseValidator.either_validate(21005, &condition)
  end

end