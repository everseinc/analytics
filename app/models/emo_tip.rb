class EmoTip < ApplicationRecord

  class << self


    def convert_to_json(emo_tips)
      Jbuilder.encode  do |json|
        emo_tips.each do |et|
          json.set! et.id, et.name
        end
      end
    end
  end

end
