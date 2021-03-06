

function EmoTipAsset(option){
  this.tips = option.tips.map(function(tip){
    return new Tip(tip);
  }),
  this.emo_id = option.emo_id,
  this.dim_ids = option.dim_ids,
  this.started_at = option.started_at,
  this.ended_at = option.ended_at
}

EmoTipAsset.prototype.functor = function(func){
  return this.tips.map(function(tip){
    return func(tip);
  });
}

EmoTipAsset.prototype.setScore = function(){
  var that = this;
  var emo_details = new EmoDetails(getJsonFromServer("data-json", "json_emo_details"));
  return this.tips.map(function(tip){
    switch (tip.name){
      case "平均値":
        return Math.round(emo_details.getAve(emo_id = that.emo_id, dim_ids = that.dim_ids, started_at = that.started_at, ended_at = that.ended_at) * 10) / 10;
      case "最大値":
        return Math.round(emo_details.getMax(emo_id = that.emo_id, dim_ids = that.dim_ids, started_at = that.started_at, ended_at = that.ended_at) * 10) / 10;
      case "最小値":
        return Math.round(emo_details.getMin(emo_id = that.emo_id, dim_ids = that.dim_ids, started_at = that.started_at, ended_at = that.ended_at) * 10) / 10;
    }
  });

}

EmoTipAsset.prototype.showScore = function(){
  var that = this;
  this.tips.map(function(tip){
    var element = document.getElementById("emo-" + that.emo_id + "-tip-" + tip.id + "-value");
    element.textContent = tip.score;
  })
}




