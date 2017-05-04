(function() {
	// Scroll to
	var scroll_buttons = Array.prototype.slice.call(document.getElementsByClassName("scroll-to"));
	scroll_buttons.map(function(button, i) {
		button.addEventListener('click', function() {
			var top = (i == 0) ? 0 : document.getElementsByClassName("report_contents_title_emotion")[i - 1].getBoundingClientRect().top + window.pageYOffset;
			window.scrollTo(0, top);
		});
	});
}());