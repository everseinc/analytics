var dateSpanChangeButton = {
	element: document.getElementById('date-span-change-button'),
	setSpan: function() {
		var span = document.getElementById('date-span-input').value.split(' - ');
		chartSetter.setSpan(new Date(span[0]), new Date(span[1]));
		tipsSetter.setSpan(new Date(span[0]), new Date(span[1]));
	},
	onClick: function() {
		this.element.addEventListener('click', this.setSpan, true);
	}
}