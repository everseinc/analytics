var report = new report();
report.setReport();
console.log(report);

report.emo_tip_asset.map(function(asset){
  var setScore =  asset.setScore();
  asset.functor(function(tip){
    tip.score = setScore[tip.id - 1];
  });
  asset
  return asset;
});

report.emo_tip_asset.map(function(asset){
  asset.showScore();
});

(function() {

	/* set default chart */
	chartSetter.new(report);
	chartSetter.reload();

	/* set date span change button*/
	dateSpanChangeButton.onClick();

}());