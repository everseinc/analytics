class EmoDetails
  include ActiveModel::Model
  attr_accessor :project_name, :app_id

  ###
  ## class methods
  #

  class << self


    # arg_start_time and arg_end_time must be a instance of Maybe
    # exampe of emo_details:  #<struct  dimensions= {"man"=> [{:name=>"好感度", :value=>72}, {:name=>"好感度", :value=>43},
    #                                                         {:name=>"好感度", :value=>32}, {:name=>"好感度", :value=>78}, {:name=>"好感度", :value=>64}]}>

    def get_all_emo_detail_by(project_id:, arg_start_time:, arg_end_time:)
      start_time, end_time = set_block_time_by(project_id: project_id, arg_start_time: arg_start_time, arg_end_time: arg_end_time)
      emo_blocks = EmoBlock.get_emo_blocks_by(started_at: start_time, ended_at: end_time, project_id: project_id, dimension_id: Maybe.zero)
      dimensions = Dimension.get_dimensions_by(project_id: project_id)
      emo_details = DetailsDiveidedByDimensions.new({})
      cache = {}
      emo_blocks.each do |eb|
        emo_name, emo_value = get_emo_and_record_by(emo_block_id: eb[0])

        # d[0] and eb[1] are dimension_id
        if cache.value?(eb[1])
          dimension_name = cache.key(eb[1])
        else
          dimensions.each do |d|
            # d[0] and eb[1] are dimension_id

            if d[0] == eb[1]
              dimension_name = d[1]
              cache[d[1]] = d[0]
              break
            end
          end
        end

        emo_details.add_detail(emo_name: emo_name, emo_value: emo_value, dimension_name: dimension_name)

      end

      emo_details
    end

    def get_kind_of_emos(emo_details: )
      kind = []
      keys = emo_details[:dimensions].keys
      keys.each do |k|
        emo_details[:dimensions][k].each do |en|
          kind << en[:name] if !kind.include?(en[:name])
        end
      end
      kind
    end

    private

      def get_emo_and_record_by(emo_block_id:)
        emo_rec = EmoRecord.find_by(emo_block_id: emo_block_id)
        emo = Emotion.find_by(id: emo_rec.emotion_id)
        [emo.name, emo_rec.value]
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

    DetailsDiveidedByDimensions = Struct.new(:dimensions) do
      def add_detail (emo_name:, emo_value:, dimension_name:)
        if self[:dimensions].key?(dimension_name)
          self[:dimensions][dimension_name] << {name: emo_name, value: emo_value}
        else
          self[:dimensions][dimension_name] = []
          self[:dimensions][dimension_name] << {name: emo_name, value: emo_value}
        end
      end
    end



end