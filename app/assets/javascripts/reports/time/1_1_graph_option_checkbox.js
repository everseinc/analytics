var graphOptionCheckbox = {
	elements: Array.prototype.slice.call(document.getElementsByClassName("graph-option-check")),
	elementsReload: function() {
		this.elements = Array.prototype.slice.call(document.getElementsByClassName("graph-option-check"));
	},
	onChange: function() {
		var self = this;
		var setEmotions = function(e) {

			valid_names = this.elements.filter(function(element, index) {
				return element.checked;
			}).map(function(element) {
				return element.value;
			});

			chartSetter.setValidEmotions(valid_names);
		}.bind(this);

		this.elements.forEach(function(element) {
			element.addEventListener("change", setEmotions);
		});
	}
}