function modal(element, mask) {
	this.state = false;
	this.trigger = null;
	this.element = element;
	this.mask = mask;
}

modal.prototype.setTrigger = function(trigger) {
	this.trigger = trigger;
}

modal.prototype.showModal = function(e) {
	this.state = true;
	this.element.addClass('visible');
	this.mask.addClass('visible');

	var callback = function (e2) {
    if (e2.target == this.mask) {
      this.mask.removeEventListener('click', callback);
      this.hideModal();
    }
  }.bind(this);
  this.mask.addEventListener('click', callback);
}

modal.prototype.hideModal = function(e) {
	this.state = false;
	this.element.removeClass('visible');
	this.mask.removeClass('visible');
}

modal.prototype.toggleModal = function(e) {
	if (this.element.hasClass('visible')) {
		this.removeModal(e);
	} else {
		this.showModal(e);
	}
}