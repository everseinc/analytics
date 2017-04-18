var BlockInfo = {
	element: document.getElementById("block_info_container"),
	tbody: document.getElementById("block_info_container_tbody"),
	children: [],
	append: function(block) {
		var div = document.createElement('tr');
		// div.classList.add('info_block');
		// div.classList.add('layer-cell');
		div.innerHTML = this.templete(block);

		this.tbody.appendChild(div);
		this.children.push({ id: block.id, dom: div});
		this.sort();
	},
	remove: function(block) {
		var dom = this.children.filter(function(v) { return v.id == block.id }).first().dom;

		this.tbody.removeChild(dom);
		this.children.some(function(v, i){
		    if (v.id == block.id) this.children.splice(i, 1);    
		}.bind(this));
	},
	sort: function() {
    this.children
    	.sort(function(a, b) { return a.id > b.id })
    	.forEach(function(v) { return this.tbody.appendChild(v.dom) }.bind(this));
	},

	templete: function(block) {
		return '\
			<td>' + block.key + '</td>\
			<td>' + block.started_at.default() + '</td>\
			<td>' + block.ended_at.default() + '</td>\
			<td>' + block.records.length + '</td>\
			<td><div style="background-color: ' + block.color() + '; width: 12px; height: 12px;"></div></td>\
		';
	},
}