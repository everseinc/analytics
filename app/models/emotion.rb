class Emotion < ApplicationRecord
  has_many :emo_records, dependent: :destroy

  class << self
    def convert_to_json(emotions)
      Jbuilder.encode  do |json|
        emotions.each do |e|
          json.set! e.id, e.name
        end
      end
    end
  end
end
