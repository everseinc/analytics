class EmoBlock < ApplicationRecord



  class << self

    # dimension_id must be Maybe!
    # return value example: [[1, 1], [2, 3]]
    def get_emo_blocks_by(started_at:, ended_at:, project_id:,  dimension_id:)
      if dimension_id.nothing?
        emo_blocks = EmoBlock.where(["project_id = ? and started_at >= ? and ended_at <= ?", project_id, started_at, ended_at]).pluck(:id, :dimension_id)
      else
        emo_blocks = EmoBlock.where(["project_id = ? and started_at >= ? and ended_at <= ? and dimension_id", project_id, started_at, ended_at, dimension_id.value]).pluck(:id, :dimension_id)
      end
    end

  end
end
