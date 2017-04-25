var canvases = Array.prototype.slice.call(document.getElementsByClassName("ratio_graph")).map(function(canvas, index) {
	return {
		canvas: canvas,
		dim_store_id: canvas.getAttribute("data-id"),
	}
});

var chartSetter = new chartSetter(canvases);