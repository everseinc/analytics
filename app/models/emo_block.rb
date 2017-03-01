class EmoBlock < ApplicationRecord
  has_one :emo_record


  class << self

    # dimension_id must be Maybe!
    # return value example: [[1, 1], [2, 3]]
    def get_emo_blocks_by(started_at:, ended_at:, project_id:,  dimension_id:, emo_name:)
      if dimension_id.nothing?
        emo_blocks = EmoBlock.joins('INNER JOIN emo_records ON emo_blocks.id = emo_records.emo_block_id').joins(sanitize_sql_array(['INNER JOIN emotions ON emo_records.emotion_id = emotions.id AND emotions.name = ?', emo_name])).where(["project_id = ? and started_at >= ? and ended_at <= ?", project_id, started_at, ended_at, emo_name]).order(:started_at).select(:id ,:project_id, :started_at, :ended_at, :name)
      else
        emo_blocks = EmoBlock.joins('INNER JOIN emo_records ON emo_blocks.id = emo_records.emo_block_id').joins(sanitize_sql_array(['INNER JOIN emotions ON emo_records.emotion_id = emotions.id AND emotions.name = ?', emo_name])).where(["project_id = ? and started_at >= ? and ended_at <= ? and dimension_id = ?", project_id, started_at, ended_at, dimension_id.value]).order(:started_at).select(:id ,:dimension_id ,:project_id, :started_at, :ended_at, :name)
      end
    end

  end
end
