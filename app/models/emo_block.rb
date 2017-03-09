class EmoBlock < ApplicationRecord

  ###
  ## associaton
  #

  has_many :emo_records
  
  has_many :emo_blocks_dimensions, dependent: :destroy
  has_many :dimensions, through: :emo_blocks_dimensions


  class << self

  end
end
