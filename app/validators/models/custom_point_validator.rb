class Models::CustomPointValidator < Models::ModelValidator
  def validate(custom_point)
    condition = Either.right(custom_point.formula) >>
                  StringValidator.not_empty >>
                  StringValidator.no_blank >>
                  StringValidator.emo_formula 


    investigate_from(condition, :formula, custom_point)



  end


end