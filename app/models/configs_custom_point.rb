class ConfigsCustomPoint < ApplicationRecord
  belongs_to :custom_point
    validates_with  Models::ConfigsCustomPointValidator
end