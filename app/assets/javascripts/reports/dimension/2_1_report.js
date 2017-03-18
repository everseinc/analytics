function reportReload() {

	filterStore.setters.dim_store(report.dim_stores.dim_stores.first().id);

	/* initialize chart */
	chartSetter.new().initialize(initializeWith.EMOTIONS);

	/* set date span change button*/
	dateSpanChangeButton.elementReload();
	dateSpanChangeButton.onClick();

}


(function() {
	reportReload();
}());