var canvases = Array.prototype.slice.call(document.getElementsByClassName("key_graph")).map(function(canvas, index) {
	return {
		canvas: canvas,
		emotion_id: report.emotions.emotions[index].id
	}
});


var chartSetterMain = new chartSetter(canvases);