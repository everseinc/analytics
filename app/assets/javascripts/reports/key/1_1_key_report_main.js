var keyReportMain = {
	element: document.getElementsByClassName("key_report_main")[0],
	toggle: function(isNull) {
		if (this.element.hasClass("show") && isNull) {
			this.element.removeClass("show");
		} else if (!this.element.hasClass("show" && !isNull)) {
			this.element.addClass("show");
		}
	}
}