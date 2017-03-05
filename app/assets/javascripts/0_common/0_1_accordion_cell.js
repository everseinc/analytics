function AccordionCell(trigger, contents) {
	this.state = false;
	this.length = 0;
	this.trigger = trigger;
	this.contents = contents;
}

AccordionCell.prototype.setLength = function() {
	this.length = this.contents.height;
}

AccordionCell.prototype.enable = function() {
	var callback = function() {
		this.contents.parentNode.toggleClass("active");
	  if (this.contents.style.maxHeight){
	    this.contents.style.maxHeight = null;
	  } else {
	    this.contents.style.maxHeight = this.contents.scrollHeight + "px";
	  }
	}.bind(this);
	this.trigger.addEventListener('click', callback);
}