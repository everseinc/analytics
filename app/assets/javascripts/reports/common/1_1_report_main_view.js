var reportMainView = {
	changer: new viewChanger(document.getElementById("report_main")),
	setHtml: function(html) {
		this.changer.setHtml(html)
	}
}