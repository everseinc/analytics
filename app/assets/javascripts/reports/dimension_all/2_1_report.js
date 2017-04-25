function reportReload() {

	filterStore.setters.dimensionAll();

	/* initialize chart */
	chartSetter.new().typePie().initialize(initializeWith.DIMSTORE);

	/* set date span change button*/
	// dateSpanChangeButton.elementReload();
	// dateSpanChangeButton.onClick();

	/* set dimension info */
	// dimensionInfo.onChange();

}


(function() {
	reportReload();
}());