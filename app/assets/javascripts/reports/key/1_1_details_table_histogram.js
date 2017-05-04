var detailsTableHistogram = {
	elements: Array.prototype.slice.call(document.getElementsByClassName("details-cell--table-tbody")),
	children: [[], [], [], [], []],
	append: function(block) {
		var self = this;
		this.elements.map(function(element) {
			var emotion_id = element.getAttribute("data-emotion-id");
			var div = document.createElement('tr');
			div.innerHTML = self.templete(block, emotion_id);

			element.appendChild(div);
			self.children[emotion_id - 1].push({ block_id: block.id, dom: div});
		});
	},
	remove: function(block) {
		var self = this;
		this.elements.map(function(element) {
			var dom = self.children.filter(function(v) { return v.id == block.id }).first().dom;

			element.removeChild(dom);
		});

		this.children.some(function(v, i){
	    if (v.id == block.id) this.children.splice(i, 1);    
		}.bind(this));
	},

	templete: function(block, emotion_id) {
		return '\
			<td class="mdl-data-table__cell--non-numeric">' + block.key + '</td>\
			<td class="mdl-data-table__cell--non-numeric">' + Math.round(block.getMax(emotion_id) * 10) / 10 + '</td>\
			<td class="mdl-data-table__cell--non-numeric">' + Math.round(block.getMin(emotion_id) * 10) / 10 + '</td>\
			<td class="mdl-data-table__cell--non-numeric">' + Math.round(block.getAve(emotion_id) * 10) / 10 + '</td>\
			<td class="mdl-data-table__cell--non-numeric">' + block.getMedian(emotion_id) + '</td>\
		';
	}
}