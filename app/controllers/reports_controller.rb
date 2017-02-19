class ReportsController < MainLayoutController
  def test
  	@projects = [{:project_name => "Test"}, {:project_name => "Test1"}, {:project_name => "Test2"}]
    @project = {:project_name => "Test"}
    @emo_blocks = [{started_at: "2017年2月10日15時00分", ended_at: "2017年2月10日16時00分"}, {started_at: "2017年2月10日16時00分", ended_at: "2017年2月10日17時00分"}]
  end
end