class EmoDetails
  include ActiveModel::Model
  attr_accessor :project_name, :app_id

  ###
  ## class methods
  #

  class << self

    def get_all_emo_detail_by(project_id:, arg_start_time:, arg_end_time:)
      start_time, end_time = set_block_time_by(project_id: project_id, arg_start_time: arg_start_time, arg_end_time: arg_end_time)

      emo_details = set_emo_details_with_json_by(project_id: project_id, start_time: start_time, end_time: end_time)
    end

    private

      def set_emo_details_with_json_by(project_id:, start_time:, end_time:)
        Jbuilder.encode do |json|
          json.emo_details do
            emo_blocks = EmoBlock.where(["project_id = ? AND started_at >= ? AND ended_at <= ?", project_id, start_time, end_time]).select(:id, :dimension_id)
            json.array!(emo_blocks) do |eb|
              json.array!(eb.emo_records) do |er|
                json.emotion_id = er.emotion_id
                json.value = er.value
                json.dimension_id = eb.dimension_id
              end
            end
          end
        end
      end


      def set_block_time_by(project_id:, arg_start_time:, arg_end_time:)
        # arg_start_time and arg_end_time must be a instance of Maybe

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