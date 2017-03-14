class Config < ApplicationRecord
  belongs_to :app
  has_many :custom_points

end