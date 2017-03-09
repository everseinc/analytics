var report = new report();
report.setReport();


(function() {

	/* set default chart */
	chartSetter.new(report);

  /* set default tips */
  tipsSetter.new(report.emo_tip_assets);

	/* set date span change button*/
	dateSpanChangeButton.onClick();

  /* set emotions checkbox */
  graphOptionCheckbox.onChange();
}());