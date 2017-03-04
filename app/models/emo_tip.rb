class EmoTip < ApplicationRecord

  class << self


    def convert_to_json(emo_tips)
      Jbuilder.encode do |json|
        json.array! emo_tips do |et|
          json.id et.id
          json.name et.name
        end
      end
    end
  end

end
