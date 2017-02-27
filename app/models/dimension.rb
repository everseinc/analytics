class Dimension < ApplicationRecord




  class << self

    # return values example: [[1, "man"], [2, "women"]]
    def get_dimensions_by(project_id:)
      dimensions = Dimension.where(project_id: project_id).pluck(:id, :name)
    end
  end
end
