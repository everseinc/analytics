var BlockInfo = {
	element: document.getElementById("block_info_container"),
	children: [],
	append: function(block) {
		var div = document.createElement('div');
		div.classList.add('info_block');
		div.classList.add('layer-cell');
		div.innerHTML = this.templete(block);

		// this.element.appendChild(div);
		this.children.push({ id: block.id, dom: div});
		this.sort();
	},
	remove: function(block) {
		var dom = this.children.filter(function(v) { return v.id == block.id }).first().dom;

		this.element.removeChild(dom);
		this.children.some(function(v, i){
		    if (v.id == block.id) this.children.splice(i, 1);    
		}.bind(this));
	},
	sort: function() {
    this.children
    	.sort(function(a, b) { return a.id > b.id })
    	.forEach(function(v) { return this.element.appendChild(v.dom) }.bind(this));
	},

	templete: function(block) {
		return '\
			<table>\
				<tr>\
					<td>key</td>\
					<td>' + block.key + '</td>\
				</tr>\
				<tr>\
					<td>開始時刻</td>\
					<td>' + block.started_at.default() + '</td>\
				</tr>\
				<tr>\
					<td>終了時刻</td>\
					<td>' + block.ended_at.default() + '</td>\
				</tr>\
				<tr>\
					<td>レコード数</td>\
					<td>' + block.records.length + '</td>\
				</tr>\
			</table>\
		';
	},
}