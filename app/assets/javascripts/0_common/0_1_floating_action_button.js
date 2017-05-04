function floatingActionButton(parent, children, fields) {
	this.parent = parent;
	this.children = children;

	if (fields) {
		this.setFieldTarget(fields);
		this.setFiledProperties();
		this.createMask();
	}
}


floatingActionButton.prototype.createMask = function() {
	var mask = document.createElement("div");
	mask.addClass("fab-button--mask");
	this.parent.parentNode.appendChild(mask);
}


/**
 * [setFieldTarget description]
 * @param {Array} fields [description]
 */
floatingActionButton.prototype.setFieldTarget = function(fields) {
	fields.map(function(field) {
		var target_id = field.getAttribute("for");
		var target = document.getElementById(target_id);

		target.fab_field = field;
	});
}



/**
 * [setFiledProperties description]
 */
floatingActionButton.prototype.setFiledProperties = function() {
	this.children.map(function(child, i) {
		if (child.fab_field) {
			var marge = child.getBoundingClientRect().height * 0.75 * (i + 1);
			var top = child.getBoundingClientRect().top + marge;
			child.fab_field.style.top = top + "px";
		}
	});
}
