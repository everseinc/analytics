function reportReload() {

	/* set default filterStore */
	filterStore.setters.key(1);

	/* initialize chart */
	chartSetter.new().initialize(initializeWith.EMOTION);

  /* set emotions filer */
  keyOptionFiler.onClick();

}


(function() {
	reportReload();
}());