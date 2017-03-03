class EmoRecord < ApplicationRecord
  belongs_to :emotion
  belongs_to :emo_block
end
