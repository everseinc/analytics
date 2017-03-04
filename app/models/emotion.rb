class Emotion < ApplicationRecord
  has_many :emo_records, dependent: :destroy

  class << self
    def convert_to_json(emotions)
      Jbuilder.encode  do |json|
        json.array! emotions do |e|
          json.id e.id
          json.name e.name
        end
      end
    end
  end
end
