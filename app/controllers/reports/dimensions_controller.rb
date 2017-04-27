class Reports::DimensionsController < ReportLayoutController

  include Concerns::Resources::Reports::DimensionsResources
  include Concerns::Filters::Reports::DimensionsSetters
  include Concerns::Filters::AuthAction
  
end
