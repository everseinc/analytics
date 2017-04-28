var keyOptionFiler = {
	elements: Array.prototype.slice.call(document.getElementsByClassName("key-option-filer")).map(function(element) {
		return new Filer(element);
	}),
	isNull: function() {
		return this.elements.every(function(filer) {
			return !filer.selected();
		});
	},
	onClick: function() {
		var setEmotions = function(e, filer) {
			var target_block = report.emo_details.findBlockByKey(filer.getLabel());

			if (filer.selected()) {
				chartSetter.appendBlockId(target_block.id);
				BlockInfo.append(target_block);
			} else {
				chartSetter.removeBlockId(target_block.id);
				BlockInfo.remove(target_block);
			}

			keyReportMain.toggle(this.isNull());
		}.bind(this);

		this.elements.forEach(function(filer) {
			filer.onClick(setEmotions);
		});
	},
	init: function() {
		var key = URL().setCurrentPage().params.key_selected;
		if (!key) return;

		this.elements.forEach(function(filer) {
			if (filer.getLabel() != key) return;

			var evt = document.createEvent("MouseEvents");  
			evt.initMouseEvent("click", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, filer.element);  
			filer.element.dispatchEvent( evt );  
		});
	}
}