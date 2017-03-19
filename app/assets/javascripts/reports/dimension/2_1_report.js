function reportReload() {

	filterStore.setters.dimStore(report.dim_stores.dim_stores.first().id);

	/* initialize chart */
	chartSetter.new().initialize(initializeWith.EMOTION);

	/* set date span change button*/
	dateSpanChangeButton.elementReload();
	dateSpanChangeButton.onClick();

}


(function() {
	reportReload();
}());