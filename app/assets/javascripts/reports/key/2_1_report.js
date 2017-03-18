function reportReload() {

	/* set default filterStore */
	filterStore.setters.key(1);

	/* initialize chart */
	chartSetter.new().initialize(initializeWith.DEFAULT);

}


(function() {
	reportReload();
}());