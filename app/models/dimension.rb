class Dimension < ApplicationRecord




  class << self

    # return values example: [[1, "man"], [2, "women"]]
    def get_dimensions_by(project_id:)
      dimensions = Dimension.where(project_id: project_id).pluck(:id, :name)
    end

    def convert_to_json(dimensions)
      Jbuilder.encode do |json|
        json.array! dimensions do |d|
          json.id d.id
          json.name d.name
        end
      end
    end
  end
end
