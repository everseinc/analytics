class ReportsController < MainLayoutController

  def show
  # need to check customer anthentificate
    # EmoDetail.get_emo_detail_by(params[:project_id], Maybe.zero, Maybe.zero)
  	@projects = [{:project_name => "Test"}, {:project_name => "Test1"}, {:project_name => "Test2"}]
    @project = {:project_name => "Test"}
    @emo_blocks = [{started_at: "2017年2月10日15時00分", ended_at: "2017年2月10日16時00分"}, {started_at: "2017年2月10日16時00分", ended_at: "2017年2月10日17時00分"}]
    @tips = [{name: "test", value: 10000},{name: "view", value: 200},{name: "users", value: 50},{name: "sessions", value: 1}]
  end
end
