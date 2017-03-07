var chartSetter = {
	chart_renderer: null,
	new: function(report) {
		this.chart_renderer = new chartRenderer(report);
		this.reload();
	},
	reload: function() {
		this.chart_renderer.reload();
	},
	setSpan: function(start, end) {
		this.chart_renderer.setSpan(start, end);
		this.reload();
	}
};