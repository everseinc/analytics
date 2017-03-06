function EmoDetails(details) {
  this.blocks = details.emo_details.map(function(block) {
    return new EmoBlock(block);
  })
}

function EmoBlock(block) {
	this.started_at = new Date(block.started_at);
	this.ended_at = new Date(block.ended_at);
	this.records = block.records.map(function(record) {
		return new EmoRecord(record);
	});
}

function EmoRecord(record) {
  this.value = record.value,
  this.dimension_id = record.dimension_id,
  this.emotion_id = record.emotion_id
}


EmoDetails.prototype.getAve = function(emo_id = null, dim_id = null, started_at = null, ended_at = null) {
  var count = 0;
  var sum = this.blocks.reduce(function(sum, block, index, array){
    if ((started_at == null || started_at <= block.started_at) && (ended_at == null || ended_at >= block.ended_at)){
      return sum + block.records.reduce(function(sum, record, index, array){
        if ((emo_id == record.emotion_id || emo_id == null) && (dim_id == record.dimension_id || dim_id == null)){
          count += 1;
          return sum + record.value;
        }
      }, 0)
    }
  }, 0)

  return sum / count;
}

EmoDetails.prototype.getMax = function(emo_id = null, dim_id = null, started_at = null, ended_at = null) {
  return this.blocks.reduce(function(max, block, index, array){
    if ((started_at == null || started_at <= block.started_at) && (ended_at == null || ended_at >= block.ended_at)){
      var new_max = block.records.reduce(function(max, record, index, array){
        if ((emo_id == record.emotion_id || emo_id == null) && (dim_id == record.dimension_id || dim_id == null)){
          return max > record.value ? max : record.value;
        }
      }, 0)
      return new_max > max ? new_max : max;
    }
  }, 0)
}

EmoDetails.prototype.getMin = function(emo_id = null, dim_id = null, started_at = null, ended_at = null) {
  return this.blocks.reduce(function(min, block, index, array){
    if ((started_at == null || started_at <= block.started_at) && (ended_at == null || ended_at >= block.ended_at)){
      var new_min = block.records.reduce(function(min, record, index, array){
        if ((emo_id == record.emotion_id || emo_id == null) && (dim_id == record.dimension_id || dim_id == null)){
          return min > record.value ? record.value : min;
        }
      }, 100000)
      return new_min > min ? min : new_min;
    }
  }, 100000)
}

EmoDetails.prototype.getBlocksAve = function() {
  return this.blocks.map(function(block) {
    return block.getAve();
  });
}

EmoDetails.prototype.getBlocksDate = function() {
  return this.blocks.map(function(block) {
    return block.started_at.getMonth() + "/" + block.started_at.getDay();
  });
}

EmoBlock.prototype.getAve = function() {
  return this.records.reduce(function(sum, record) {
    return sum + record.value;
  }, 0);
}


