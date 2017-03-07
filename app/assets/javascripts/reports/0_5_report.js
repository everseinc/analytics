function report() {
  this.emo_details = null
  this.emotions = null
  this.dimensions = null
  this.emo_tip_assets = null
};

report.prototype.setReport = function() {
  this.setEmoDetails();
  this.setEmotions();
  this.setDimensions();
  this.setEmoTipAssets();
}

report.prototype.setEmoDetails = function() {
  this.emo_details = new EmoDetails(getJsonFromServer("data-json", "json_emo_details"));
}

report.prototype.setEmotions = function() {
  this.emotions = new Emotions(getJsonFromServer("data-json", "json_emotions"));
}

report.prototype.setDimensions = function() {
  this.dimensions = getJsonFromServer("data-json", "json_dimensions");
}

report.prototype.setEmoTipAssets = function() {
  this.emo_tip_assets = new EmoTipAssets();
}