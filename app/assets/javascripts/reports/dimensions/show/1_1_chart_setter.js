var canvases = [{
		canvas: document.getElementsByClassName("ratio_graph")[0],
		dim_store_id: document.getElementsByClassName("ratio_graph")[0].getAttribute("data-id"),
	}];

var chartSetter = new chartSetter(canvases);