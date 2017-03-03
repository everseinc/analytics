(function() {

  var emo_details = new EmoDetails(getJsonFromServer("data-json", "json_emo_details"));
  var emotions = getJsonFromServer("data-json", "json_emotions");
  var dimensions = getJsonFromServer("data-json", "json_dimensions");
  var emo_tips = getJsonFromServer("data-json", "json_emo_tips");
  var emo_tip_names = EmoTipShow.prototype.getNames();



}());