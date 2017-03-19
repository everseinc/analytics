var keyOptionCheckbox = {
	elements: Array.prototype.slice.call(document.getElementsByClassName("key-option-check")),
	elementsReload: function() {
		this.elements = Array.prototype.slice.call(document.getElementsByClassName("key-option-check"));
	},
	onChange: function() {
		var toggleKeys = function(e) {
			var target_block = report.emo_details.findBlockByKey(e.target.value);

			if (e.target.checked) {
				chartSetter.appendBlockId(target_block.id);
			} else {
				chartSetter.removeBlockId(target_block.id);
			}
		}.bind(this);

		this.elements.forEach(function(element) {
			element.addEventListener("change", toggleKeys);
		});
	}
}