class CustomPoint < ApplicationRecord
  validates_with  Models::CustomPointValidator

end