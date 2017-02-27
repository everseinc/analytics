nclass ReportsController < MainLayoutController

  include Concerns::Filters::AuthAction

  def main
    #later, move this code to factories/report_details.rb
    @project = Project.find_by(params[:project_id])
    @projects = Project.get_related_projects(project_id: @project.id, limit: 5)
    @emo_blocks = [{started_at: "2017年2月10日15時00分", ended_at: "2017年2月10日16時00分"}, {started_at: "2017年2月10日16時00分", ended_at: "2017年2月10日17時00分"}]
    @emo_details = EmoDetails.get_all_emo_detail_by(project_id: @project.id, arg_start_time: Maybe.zero, arg_end_time: Maybe.zero)
    @dimensions = @emo_details[:dimensions].keys
    @emo_kinds = EmoDetails.get_kind_of_emos(emo_details: @emo_details)
    @tips = [{name: "test", value: 10000},{name: "view", value: 200},{name: "users", value: 50},{name: "sessions", value: 1}]
  end
end
