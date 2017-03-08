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


EmoDetails.prototype.getAve = function(emo_id = null, dim_ids = null, started_at = null, ended_at = null) {
  var count = 0;
  var sum = this.blocks.reduce(function(sum, block, index, array){
    if ((started_at == null || started_at <= block.started_at) && (ended_at == null || ended_at >= block.ended_at)){
      return sum + block.records.reduce(function(sum, record, index, array){
        if ((emo_id == record.emotion_id || emo_id == null) && (dim_ids == null || dim_ids.indexOf(record.dimension_id) != -1)){
          count += 1;
          return sum + record.value;
        }else{
          return sum;
        }
      }, 0)
    }else{
      return sum;
    }
  }, 0)
  return sum == 0 ? 0 : sum / count;
}

EmoDetails.prototype.getMax = function(emo_id = null, dim_ids = null, started_at = null, ended_at = null) {
  return this.blocks.reduce(function(max, block, index, array){
    if ((started_at == null || started_at <= block.started_at) && (ended_at == null || ended_at >= block.ended_at)){
      var new_max = block.records.reduce(function(max, record, index, array){
        if ((emo_id == record.emotion_id || emo_id == null) && (dim_ids == null || dim_ids.indexOf(record.dimension_id) != -1)){
          return max > record.value ? max : record.value;
        }else{
          return max;
        }
      }, 0)
      return new_max > max ? new_max : max;
    }else{
      return max;
    }
  }, 0)
}

EmoDetails.prototype.getMin = function(emo_id = null, dim_ids = null, started_at = null, ended_at = null) {
  var min =  this.blocks.reduce(function(min, block, index, array){
    if ((started_at == null || started_at <= block.started_at) && (ended_at == null || ended_at >= block.ended_at)){
      var new_min = block.records.reduce(function(min, record, index, array){
        if ((emo_id == record.emotion_id || emo_id == null) && (dim_ids == null || dim_ids.indexOf(record.dimension_id) != -1)){
          return min > record.value ? record.value : min;
        }else{
          return min;
        }
      }, 100000)
      return new_min > min ? min : new_min;
    }else{
      return min;
    }
  }, 100000);

  return min == 100000 ? 0 : min;
}

EmoDetails.prototype.getBlocksAve = function(emo_id = null, options = {}) {
  var valid_blocks = this.blocks;

  /* option filter */
  if (options.span && options.span.start && options.span.end) {
    valid_blocks = valid_blocks.filter(function(block, index) {
      if (options.span.start < block.started_at && block.started_at < options.span.end) return true;
    });
  }

  return valid_blocks.map(function(block) {
    return block.getAve(emo_id);
  });
}

EmoDetails.prototype.getBlocksDate = function(options = {}) {
  var valid_blocks = this.blocks;

  /* option filter */
  if (options.span && options.span.start && options.span.end) {
    valid_blocks = valid_blocks.filter(function(block, index) {
      return (options.span.start < block.started_at && block.started_at < options.span.end);
    });
  }

  return valid_blocks.map(function(block) {
    return block.started_at.getMonth() + 1
    + "/" + block.started_at.getDate()
    + " " + block.started_at.getHours()
    + ":" + block.started_at.getMinutes()
    + ":" + block.started_at.getSeconds();
  });
}

EmoBlock.prototype.getAve = function(emo_id = null) {
  var filtered = this.records.filter(function(record, index) {
    if (emo_id == record.emotion_id || emo_id == null) return true;
  });
  return filtered.reduce(function(sum, record) {
      return sum + record.value;
  }, 0) / filtered.length;
}

