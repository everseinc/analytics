function reportReload() {

	/* set default filterStore */
	filterStore.setters.key(1);

	/* initialize chart */
	chartSetter.new().initialize(initializeWith.EMOTION);

	/* set emotions checkbox */
  keyOptionCheckbox.elementsReload();
  keyOptionCheckbox.onChange();

}


(function() {
	reportReload();
}());