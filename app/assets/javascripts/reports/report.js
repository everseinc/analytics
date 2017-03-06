(function() {

  var emo_details = new EmoDetails(getJsonFromServer("data-json", "json_emo_details"));
  var emotions = new Emotions(getJsonFromServer("data-json", "json_emotions"));
  var dimensions = getJsonFromServer("data-json", "json_dimensions");

  var emo_tip_asset = emotions.functor(function(emotion){
    var emo_tips = getJsonFromServer("data-json", "json_emo_tips");

    return new EmoTipAsset({
      tips: emo_tips,
      emo_id: emotion.id,
      dim_id: null,
      started_at: null,
      ended_at: null
    });
  });

  emo_tip_asset.map(function(asset){
    var setScore =  asset.setScore();
    asset.functor(function(tip){
      tip.score = setScore[tip.id - 1];
    });
    asset
    return asset;
  });

  emo_tip_asset.map(function(asset){
    asset.showScore();
  });





}());