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
		var setEmotions = function(e, filter) {
			var target_block = report.emo_details.findBlockByKey(filter.getLabel());

			if (filter.selected()) {
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
	}
}