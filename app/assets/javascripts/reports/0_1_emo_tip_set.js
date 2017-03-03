function EmoTipSet(option){
  this.name = option.name,
  this.emo_id = option.emo_id,
  this.dim_id = option.dim_id,
  this.started_at = option.started_at,
  this.ended_at = option.ended_at
}

function EmoTipAsset(option){
  this.names = option.names,
  this.emo_id = option.emo_id,
  this.dim_id = option.dim_id,
  this.started_at = option.started_at,
  this.ended_at = option.ended_at
}

EmoTipAsset.prototype.emoTipSet = function(emo_tip_sets){
  return emo_tip_sets.names.map(function(name){
    return new EmoTipSet({
      name: name,
      emo_id: emo_tip_sets.emo_id,
      dim_id: emo_tip_sets.dim_id,
      started_at: emo_tip_sets.started_at,
      ended_at: emo_tip_sets.ended_at
    });
  });

}

EmoTipSet.prototype.getScore = function(){
  switch (expression){
    case "平均値":
      return EmoDetails.prototype.getAve(emo_id = this.emo_id, dim_id = this.dim_id, started_at = this.started_at, ended_at = this.ended_at);
    case "最大値":
      return EmoDetails.prototype.getMax(emo_id = this.emo_id, dim_id = this.dim_id, started_at = this.started_at, ended_at = this.ended_at);

    case "最小値":
      return EmoDetails.prototype.getMin(emo_id = this.emo_id, dim_id = this.dim_id, started_at = this.started_at, ended_at = this.ended_at);
  }

}

