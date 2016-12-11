class Customer < ApplicationRecord
  # before_validation CustomerCallbacks.new()
  validates_with  Models::CustomerValidator
end
