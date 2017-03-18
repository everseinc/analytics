function reportReload() {

	filterStore.setters.dim_store(report.dim_stores.dim_stores.first().id);

	/* initialize chart */
	chartSetter.new().initialize(initializeWith.EMOTIONS);

}


(function() {
	reportReload();
}());