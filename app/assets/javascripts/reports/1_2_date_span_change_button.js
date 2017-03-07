var dateSpanChangeButton = {
	element: document.getElementById('date-span-change-button'),
	setSpan: function() {
		var span = document.getElementById('date-span-input').value.split(' - ');
		var options = {
			span: {
				start: new Date(span[0]),
				end: new Date(span[1])
			}
		}
		chartSetter.setSpan(options);
	},
	onClick: function() {
		this.element.addEventListener('click', this.setSpan, true);
	}
}