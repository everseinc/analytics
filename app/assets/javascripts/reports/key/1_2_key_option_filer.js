var keyOptionFiler = {
	elements: Array.prototype.slice.call(document.getElementsByClassName("key-option-filer")).map(function(element) {
		return new Filer(element);
	}),
	loader: document.getElementById("key_report_loader"),
	isNull: function() {
		return this.elements.every(function(filer) {
			return !filer.selected();
		});
	},
	onClick: function() {
		var self = this;
		var setEmotions = function(e, filer) {

			// start loading
			self.loader.addClass("show");
			keyReportMain.toggle("hide");

			// start main process after 1000 ms
			setTimeout(function() {
				var target_block = report.emo_details.findBlockByKey(filer.getLabel());

				if (filer.selected()) {
					chartSetterMain.appendBlockId(target_block.id);
					setTimeout(function() {
						chartSetterHistogram.append(target_block.id);
					}, 300);
					BlockInfo.append(target_block);
					detailsTableHistogram.append(target_block);
				} else {
					chartSetterMain.removeBlockId(target_block.id);
					setTimeout(function() {
						chartSetterHistogram.remove(target_block.id);
					}, 300);
					BlockInfo.remove(target_block);
					detailsTableHistogram.remove(target_block);
				}

				// hide loader more after 1000 ms
				setTimeout(function() {
					self.loader.removeClass("show");
					keyReportMain.toggle("show");
				}, 1000);
			}, 1000);
		};

		// set event listener
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