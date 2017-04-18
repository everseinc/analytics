function Filer(element) {
	this.element = element;
}

Filer.prototype.onClick = function(f) {
	var callback = function(e) {
		this.toggle();

		f(e, this);
	}.bind(this);
	this.element.addEventListener("click", callback, false);
}

Filer.prototype.toggle = function() {
	this.element.toggleClass("selected");
}

Filer.prototype.selected = function() {
	return this.element.hasClass("selected");
}

Filer.prototype.getLabel = function() {
	return this.element.getAttribute("data-label");
}