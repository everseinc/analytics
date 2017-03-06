class ReportsController < MainLayoutController

  include Concerns::Filters::AuthAction
  include Concerns::Filters::ReportsSetters

  def main
    #later, move this code to factories/report_details.rb
    @project = Project.find_by(id: params[:project_id])
    @projects = Project.get_related_projects(project_id: @project.id, limit: 5)
    @emo_blocks = [{started_at: "2017年2月10日15時00分", ended_at: "2017年2月10日16時00分"}, {started_at: "2017年2月10日16時00分", ended_at: "2017年2月10日17時00分"}]
    @dimensions = Dimension.where(project_id: params[:project_id])
    @emotions = Emotion.all.select(:id ,:name)
    @tips = EmoTip.all.select(:id, :name)

    if request.xhr?
      @page_partial = "#{params[:i1]}/#{params[:i2]}"
      render 'load'
    end

   # json

    @emo_details =  EmoDetails.get_all_emo_detail_by(project_id: @project.id, arg_start_time: Maybe.zero, arg_end_time: Maybe.zero)
    @json_emotions = Emotion.convert_to_json(@emotions)
    @json_dimensions = Dimension.convert_to_json(@dimensions)
    @json_emo_tips = EmoTip.convert_to_json(@tips)
  end


  ###
  ## Ajax
  #

  def load
  end
end
