class DimStore < ApplicationRecord
	has_many :dimensions
	belongs_to :project


  ###
  ## class methods
  #

  class << self

    def convert_to_json(dim_stores)
      Jbuilder.encode do |json|
        json.array! dim_stores do |ds|
          json.id ds.id
          json.key ds.key
          json.names do
          	json.array!(ds.dimensions) do |d|
              json.id d.id
              json.name d.name
            end
          end
        end
      end
    end
  end
end
