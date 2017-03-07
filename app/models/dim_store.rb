class DimStore < ApplicationRecord
	has_many :dimensions
	belongs_to :project
end
