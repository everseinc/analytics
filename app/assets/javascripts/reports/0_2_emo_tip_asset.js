

function EmoTipAsset(option){
  this.tips = option.tips.map(function(tip){
    return new Tip(tip);
  }),
  this.emo_id = option.emo_id,
  this.dim_id = option.dim_id,
  this.started_at = option.started_at,
  this.ended_at = option.ended_at
}

EmoTipAsset.prototype.functor = function(func){
  return this.tips.map(function(tip){
    return func(tip);
  });
}


