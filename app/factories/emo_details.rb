class EmoDetails
  include ActiveModel::Model
  attr_accessor :project_name, :app_id

  ###
  ## class methods
  #

  class << self

    def get_all_emo_detail_by(project_id:, arg_start_time:, arg_end_time:)
      start_time, end_time = set_block_time_by(project_id: project_id, arg_start_time: arg_start_time, arg_end_time: arg_end_time)
      dimensions = Dimension.get_dimensions_by(project_id: project_id)

      Jbuilder.encode do |json|
        json.emo_details do
          dimensions.each do |d|
            emo_blocks = EmoBlock.get_emo_blocks_by(started_at: start_time, ended_at: end_time, project_id: project_id, dimension_id: Maybe.new(d[0]))
            json.set! d[1] do
              json.array!(emo_blocks) do |eb|
                emo_name, emo_value, emo_started_at, emo_ended_at = get_emo_and_record_by(emo_block_id: eb[0])
                json.name = emo_name
                json.value = emo_value
                json.started_at = emo_started_at
                json.ended_at = emo_ended_at
              end
            end
          end
        end
      end
    end


    private

      def get_emo_and_record_by(emo_block_id:)
        emo_started_at, emo_ended_at = EmoBlock.where(id: emo_block_id).pluck(:started_at, :ended_at)
        emo_rec = EmoRecord.find_by(emo_block_id: emo_block_id)
        emo = Emotion.find_by(id: emo_rec.emotion_id)
        [emo.name, emo_rec.value, emo_started_at, emo_ended_at]
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

    # DetailsDiveidedByDimensions = Struct.new(:dimensions) do
    #   def add_detail (emo_name:, emo_value:, dimension_name:)
    #     if self[:dimensions].key?(dimension_name)
    #       self[:dimensions][dimension_name] << {name: emo_name, value: emo_value}
    #     else
    #       self[:dimensions][dimension_name] = []
    #       self[:dimensions][dimension_name] << {name: emo_name, value: emo_value}
    #     end
    #   end
    # end



end