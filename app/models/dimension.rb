class Dimension < ApplicationRecord

  ###
  ## associaton
  #

  belongs_to :dim_store

  has_many :emo_blocks_dimensions, dependent: :destroy
  has_many :emo_blocks, through: :emo_blocks_dimensions




  class << self

    # return values example: [[1, "man"], [2, "women"]]
    def get_dimensions_by(project_id:)
      dimensions = Dimension.where(project_id: project_id).pluck(:id, :name)
    end

    def convert_to_json(dimensions)
      Jbuilder.encode do |json|
        json.array! dimensions do |d|
          json.id d.id
          json.name d.name
        end
      end
    end
  end
end
