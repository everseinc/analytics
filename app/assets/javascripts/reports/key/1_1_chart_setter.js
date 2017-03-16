var chartSetter = {
	canvas: document.getElementById("key_graph"),
	chart_renderer: null,
	new: function(report) {
		if (this.chart_renderer) {
			this.chart_renderer.chart.destroy();
		}
		this.chart_renderer = new chartRenderer(report, this.canvas);
		this.chart_renderer.setRecordData(1);
		this.reload();
	},
	reload: function() {
		this.chart_renderer.reload();
	},
	setSpan: function(start, end) {
		this.chart_renderer.setSpan(start, end);
		this.reload();
	},
	setEmotions: function(names) {
		this.chart_renderer.setEmotions(names);
		this.reload();
	}
};