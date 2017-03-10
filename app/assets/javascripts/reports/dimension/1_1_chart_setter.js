var chartSetter = {
	canvases: function(report) {
		var canvases = Array.prototype.slice.call(document.getElementsByClassName("dimension_graph"));
		return canvases.map(function(canvas, index) {
			return {
				canvas: canvas,
				emotion: report.emotions.emotions[index]
			}
		});
	},
	chart_renderers: null,
	new: function(report) {
		this.chart_renderers = this.canvases(report).map(function(canvas) {
			var renderer = new chartRenderer(report, canvas.canvas);
			renderer.emotions = [canvas.emotion];
			renderer.getData();
			return renderer;
		});
		this.reload();
	},
	reload: function() {
		this.chart_renderers.map(function(chart_renderer) {
			chart_renderer.reload();
		});
	},
	setSpan: function(start, end) {
		this.chart_renderers.map(function(chart_renderer) {
			chart_renderer.setSpan(start, end);
		});
		this.reload();
	}
};