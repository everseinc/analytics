var chartSetter = {
	chart_renderer: null,
	new: function(report) {
		this.chart_renderer = new chartRenderer(report);
	},
	reload: function() {
		this.chart_renderer.reload();
	},
	setSpan: function(options) {
		this.chart_renderer.setSpan(options);
		this.reload();
	}
};