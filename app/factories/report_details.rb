class ReportDetails
  attr_reader :project, :dimensions, :emotions, :tips, :emo_details, :json_emotions,
              :json_dimensions, :json_emo_tips
  def initialize(project_id:)
    @project = Project.find_by(id: project_id)
    @dimensions = Dimension.where(project_id: project_id)
    @emotions = Emotion.all.select(:id ,:name)
    @tips = EmoTip.all.select(:id, :name)

    @emo_details =  EmoDetails.get_all_emo_detail_by(project_id: @project.id, arg_start_time: Maybe.zero, arg_end_time: Maybe.zero)
    @json_emotions = Emotion.convert_to_json(@emotions)
    @json_dimensions = Dimension.convert_to_json(@dimensions)
    @json_emo_tips = EmoTip.convert_to_json(@tips)

  end
end