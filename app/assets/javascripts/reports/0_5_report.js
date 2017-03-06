function report() {
  this.emo_details = null
  this.emotions = null
  this.dimensions = null
  this.emo_tip_asset = null
};

report.prototype.setReport = function() {
  this.setEmoDetails();
  this.setEmotions();
  this.setDimensions();
  this.setEmoTipAsset();
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

report.prototype.setEmoTipAsset = function() {
  this.emo_tip_asset = this.emotions.functor(function(emotion){
    var emo_tips = getJsonFromServer("data-json", "json_emo_tips");

    return new EmoTipAsset({
      tips: emo_tips,
      emo_id: emotion.id,
      dim_id: null,
      started_at: null,
      ended_at: null
    });
  });
}