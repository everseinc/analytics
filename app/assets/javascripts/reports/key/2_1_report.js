var report = new report();
report.setReport();

function reportReload() {

	console.log(report);

	/* set default chart */
	chartSetter.new(report);

}


(function() {
	reportReload();
}());