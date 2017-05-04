var keyReportMain = {
	element: document.getElementsByClassName("key_report_main")[0],
	toggle: function(action) {
		if (this.element.hasClass("show") && action == "hide") {
			this.element.removeClass("show");
		} else if (!this.element.hasClass("show") && action == "show") {
			this.element.addClass("show");
		}
	}
}