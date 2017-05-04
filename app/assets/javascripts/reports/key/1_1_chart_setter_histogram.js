var chartSetterHistogram = {
	parentNodes: Array.prototype.slice.call(document.getElementsByClassName("key_histogram_graph_area")).map(function(node) {
		node.emotion_id = node.getAttribute("data-emotion-id");
		return node;
	}),
	setter: null,
	children: [[], [], [], [], []],
	canvases: [],
	append: function(block_id) {
		var self = this;
		this.parentNodes.map(function(node) {
			var emotion_id = node.emotion_id;
			var div = document.createElement('div');
			div.addClass("key_histogram_graph_wrapper");
			var canvas = document.createElement('canvas');
			canvas.addClass("graph key_histogram_graph");
			canvas.setAttribute("data-block-id", block_id);
			canvas.setAttribute("data-emotion-id", emotion_id);
			div.appendChild(canvas);

			self.canvases.push({
				canvas: canvas,
				emotion_id: emotion_id,
				block_id: block_id,
			});

			self.children[emotion_id - 1].push({ block_id: block_id, dom: div});
			node.appendChild(div);
		});

		this.reload();
	},
	remove: function(block_id) {
		this.parentNodes.map(function(node) {
			var emotion_id = node.emotion_id;
			var dom = this.children[emotion_id - 1].filter(function(v) { return v.block_id == block_id }).first().dom;

			node.removeChild(dom);
		}.bind(this));

		this.children.map(function(v, i) {
		    if (v.block_id == block_id) this.children.splice(i, 1);
		}.bind(this));

		this.reload();
	},

	sort: function(node) {
		this.children[node.emotion_id - 1]
			.sort(function(a, b) { return a.block_id > b.block_id })
  		.forEach(function(v) { return node.appendChild(v.dom) });
	},

	reload: function() {
		this.setter = new chartSetter(this.canvases);
		this.setter
			.new()
			.typeBar()
			.histogram()
			.initialize([initializeWith.EMOTION, initializeWith.BLOCK]);
	},

	templete: function(emotion_id, block_id) {
		return '\
			<canvas class="graph key_histogram_graph" data-block-id="' +  block_id + '" data-emotion-id="' + emotion_id + '"></canvas>\
		';
	},
}


