function Tip(tip){
  this.id = tip.id,
  this.name = tip.name
}

Tip.prototype.getScore = function(){
  switch (this.name){
    case "平均値":
      return EmoDetails.prototype.getAve(emo_id = this.emo_id, dim_id = this.dim_id, started_at = this.started_at, ended_at = this.ended_at);
    case "最大値":
      return EmoDetails.prototype.getMax(emo_id = this.emo_id, dim_id = this.dim_id, started_at = this.started_at, ended_at = this.ended_at);

    case "最小値":
      return EmoDetails.prototype.getMin(emo_id = this.emo_id, dim_id = this.dim_id, started_at = this.started_at, ended_at = this.ended_at);
  }

}