var canvases = Array.prototype.slice.call(document.getElementsByClassName("dimension_graph")).map(function(canvas, index) {
	return {
		canvas: canvas,
		emotion_id: report.emotions.emotions[index].id
	}
});

var chartSetter = new chartSetter(canvases);