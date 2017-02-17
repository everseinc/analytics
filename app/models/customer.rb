class Customer < ApplicationRecord
  before_validation ::Callbacks::CustomerCallbacks
  validates_with  Models::CustomerValidator

end

