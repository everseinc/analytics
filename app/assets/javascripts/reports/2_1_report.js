var report = new report();
report.setReport();


(function() {

	var dim_stores = new DimStores(report.dim_stores);
	console.log(dim_stores.dim_stores[0].allEmoBlocks(report.emo_details));


	/* set default chart */
	chartSetter.new(report);

  /* set default tips */
  tipsSetter.new(report.emo_tip_assets);

	/* set date span change button*/
	dateSpanChangeButton.onClick();

  /* set emotions checkbox */
  graphOptionCheckbox.onChange();
}());