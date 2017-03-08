function TipsRenderer(assets) {
  this.assets = assets;
  this.assets.setScore();
}

TipsRenderer.prototype.reload = function() {
  this.assets.showScore()
}

TipsRenderer.prototype.setDimensions = function(dim_ids){
  this.assets.assets.map(function(asset){
    asset.dim_ids = dim_ids;
    return asset;
  });
  this.assets.setScore()
}

TipsRenderer.prototype.setSpan = function(started_at, ended_at){
  this.assets.assets.map(function(asset){
    asset.started_at = started_at;
    asset.ended_at = ended_at;
    return asset;
  })
  this.assets.setScore()
}