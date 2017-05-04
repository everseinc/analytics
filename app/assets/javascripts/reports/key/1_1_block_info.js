var BlockInfo = {
	element: document.getElementById("block_info_container"),
	tbody: document.getElementById("block_info_container_tbody"),
	project_id: document.body.getAttribute("data-project-id"),
	children: [],
	append: function(block) {
		var div = document.createElement('tr');
		// div.classList.add('info_block');
		// div.classList.add('layer-cell');
		div.innerHTML = this.templete(block);

		this.tbody.appendChild(div);
		this.children.push({ id: block.id, dom: div});
		// this.sort();
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
		var dimensions = block.getDimensions().reduce(function(pre, now) {
			return pre + '<a href="/reports/' + this.project_id + '/dimensions/' + now.key.id +'"><div class="sm-tag">' + now.name + '</div></a>';
		}.bind(this), '');

		return '\
			<td>' + block.key + '</td>\
			<td>' + block.started_at.default() + '</td>\
			<td>' + block.ended_at.default() + '</td>\
			<td>' + block.records.length + '</td>\
			<td>' + dimensions + '</td>\
			<td><div style="background-color: ' + block.color() + '; width: 12px; height: 12px;"></div></td>\
		';
	},
}