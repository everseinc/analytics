class Reports::DimensionsController < ReportLayoutController

  include Concerns::Resources::Reports::DimensionsResources
  include Concerns::Filters::AuthAction
  include Concerns::Filters::ReportsSetters
  
end
