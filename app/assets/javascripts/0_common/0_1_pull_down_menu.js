function pullDownMenu(element) {
	this.state = false;
	this.trigger = null;
	this.element = element;
}

pullDownMenu.prototype.setTrigger = function(trigger) {
	this.trigger = trigger;
}

pullDownMenu.prototype.addMenu = function(e) {
	this.state = true;
	this.element.addClass('show');
	// this.addHideFunc();
	var callback = function (e2) {
    if (e !== e2 && e2.target.parentNode !== this.element && e2.target.parentNode.parentNode !== this.element) {
      document.removeEventListener('click', callback);
      this.removeMenu();
    }
  }.bind(this);
  document.addEventListener('click', callback);
}

pullDownMenu.prototype.removeMenu = function(e) {
	this.state = false;
	// this.removeHideFunc();
	this.element.removeClass('show');
}

pullDownMenu.prototype.toggleMenu = function(e) {
	if (this.element.hasClass('show')) {
		this.removeMenu(e);
	} else {
		this.addMenu(e);
	}
}