class Emotion < ApplicationRecord
  has_many :emo_records, dependent: :destroy
end
