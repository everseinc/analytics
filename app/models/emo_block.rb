class EmoBlock < ApplicationRecord
  has_many :emo_records
  belongs_to :dimension


  class << self

  end
end
