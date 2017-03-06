function viewChanger(element) {
	this.element = element;
	this.html = element.innerHTML;
}

(function(proto) {

	/* private method */
  function _changeView() {
    this.element.innerHTML = this.html;
  }

  proto.setHtml = function(html) {
		this.html = html;
		_changeView.call(this);
		render_main_chart();
	}

}(viewChanger.prototype));