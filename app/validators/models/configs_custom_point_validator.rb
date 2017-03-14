class Models::ConfigsCustomPointValidator < Models::ModelValidator
  def validate(config_custom_point)
    condition = Either.right(config_custom_point.formula_name) >>
                  StringValidator.not_empty >>
                  StringValidator.no_blank


    investigate_from(condition, :formula_name, config_custom_point)



  end


end