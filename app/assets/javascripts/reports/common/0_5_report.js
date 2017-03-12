function report() {
  this.emo_details = null
  this.emotions = null
  this.dim_stores = null
  this.emo_tip_assets = null
};

report.prototype.setReport = function() {
  this.setEmoDetails();
  this.setEmotions();
  this.setDimStores();
  this.setEmoTipAssets();
}

report.prototype.setEmoDetails = function() {
  this.emo_details = new EmoDetails(getJsonFromServer("data-json", "json_emo_details"));
}

report.prototype.setEmotions = function() {
  this.emotions = new Emotions(getJsonFromServer("data-json", "json_emotions"));
}

report.prototype.setDimStores = function() {
  this.dim_stores = new DimStores(getJsonFromServer("data-json", "json_dim_stores"));
}

report.prototype.setEmoTipAssets = function() {
  this.emo_tip_assets = new EmoTipAssets();
}