class Customer < ApplicationRecord
  # before_validation Callbacks::CustomerCallbacks.new()
  validates_with  Models::CustomerValidator

end

