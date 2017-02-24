class EmoDetails
  include ActiveModel::Model
  attr_accessor :project_name, :app_id

  ###
  ## class methods
  #

  class << self

    def get_emo_detail_by(project_id, arg_start_time, arg_end_time)
      start_time, end_time = set_block_time_by(project_id, arg_start_time, arg_end_time)
    end

    private

      def get_emo_by(emo_block_id)
        emo_rec = EmotionRecord.find_by(emo_block_id: emo_block_id).select(:emotion_id, :value)
        emo = Emotion.find_by(id: emo_rec.emotion_id).select(:name)
        [emo.name, emo_rec.value]
      end

      def set_block_time_by(project_id, arg_start_time, arg_end_time)
        # arg_start_time and arg_end_time is a instance of Maybe

        if arg_start_time.nothing?
          emo_block = EmoBlock.where(project_id: project_id).select(:started_at).order(:started_at).first
          start_time = emo_block.started_at
        else
          start_time = arg_start_time.value
        end

        if arg_end_time.nothing?
          emo_block = EmoBlock.where(project_id: project_id).select(:ended_at).order(:ended_at).last
          end_time = emo_block.ended_at
        else
          end_time = arg_end_time.value
        end

        [start_time, end_time]

      end
  end

end