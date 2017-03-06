var setDefaultChart = function() {
  var default_report_chart_renderer = new chartRenderer(report);
  default_report_chart_renderer.reload();
};

(function() {
	setDefaultChart();
}());