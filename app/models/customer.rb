class Customer < ApplicationRecord
  before_validation CustomerCallback.new
end
