function reportReload() {

	/* set default filterStore */
	filterStore.setters.key(1);

	/* initialize chart */
	chartSetterMain.new().initialize(initializeWith.EMOTION);

	/* initialize histogram chart */
	// chartSetterHistogram.

  /* set emotions filer */
  keyOptionFiler.onClick();
  keyOptionFiler.init();

}


(function() {
	reportReload();
}());