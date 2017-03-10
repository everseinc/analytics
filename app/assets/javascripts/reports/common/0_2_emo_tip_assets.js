function EmoTipAssets (){
  var emotions = new Emotions(getJsonFromServer("data-json", "json_emotions"));
  this.assets = emotions.functor(function(emotion){
    var emo_tips = getJsonFromServer("data-json", "json_emo_tips");

    return new EmoTipAsset({
      tips: emo_tips,
      emo_id: emotion.id,
      dim_ids: null,
      started_at: null,
      ended_at: null
    });
  });
}

EmoTipAssets.prototype.setScore = function(){
  this.assets.map(function(asset){
    var setScore = asset.setScore();
    asset.functor(function(tip){
      tip.score = setScore[tip.id - 1];
    });
    return asset;
  });
}

EmoTipAssets.prototype.showScore = function(){
  this.assets.map(function(asset){
    asset.showScore();
  });
}
