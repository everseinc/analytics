function reportReload() {

	/* set default filterStore */
	var valid_names = report.emotions.names();
	filterStore.setters.time(valid_names);

	/* set default chart */
	chartSetter.new().initialize(initializeWith.DEFAULT);

  /* set default tips */
  tipsSetter.new(report.emo_tip_assets);

	/* set date span change button*/
	dateSpanChangeButton.elementReload();
	dateSpanChangeButton.onClick();

  /* set emotions checkbox */
  graphOptionCheckbox.elementsReload();
  graphOptionCheckbox.onChange();

}


(function() {
	reportReload();
}());