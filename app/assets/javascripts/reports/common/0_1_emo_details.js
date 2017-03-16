function EmoDetails(details) {
  this.blocks = details.emo_details.map(function(block) {
    return new EmoBlock(block);
  })
}

function EmoBlock(block) {
  this.id = block.id
	this.started_at = new Date(block.started_at);
	this.ended_at = new Date(block.ended_at);
  this.key = block.key;
  this.dimension_ids = block.dimension_ids;
	this.records = block.records.map(function(record) {
		return new EmoRecord(record);
	});
}

function EmoRecord(record) {
  this.value = record.value,
  this.emotion_id = record.emotion_id
}


// ------------------------------------------------------------
// EmoDetails prototype
// ------------------------------------------------------------

EmoDetails.prototype.getAve = function(emo_id = null, dim_id = null, started_at = null, ended_at = null) {
  var count = 0;
  var sum = this.blocks.reduce(function(sum, block, index, array){
    if ((started_at == null || started_at <= block.started_at) && (ended_at == null || ended_at >= block.ended_at) && (dim_id == null || block.dimension_ids.indexOf(dim_id) != -1)){
      return sum + block.records.reduce(function(sum, record, index, array){
        if (emo_id == record.emotion_id || emo_id == null){
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

EmoDetails.prototype.getMax = function(emo_id = null, dim_id = null, started_at = null, ended_at = null) {
  return this.blocks.reduce(function(max, block, index, array){
    if ((started_at == null || started_at <= block.started_at) && (ended_at == null || ended_at >= block.ended_at) && (dim_id == null || block.dimension_ids.indexOf(dim_id) != -1)){
      var new_max = block.records.reduce(function(max, record, index, array){
        if (emo_id == record.emotion_id || emo_id == null){
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

EmoDetails.prototype.getMin = function(emo_id = null, dim_id = null, started_at = null, ended_at = null) {
  var min =  this.blocks.reduce(function(min, block, index, array){
    if ((started_at == null || started_at <= block.started_at) && (ended_at == null || ended_at >= block.ended_at) && (dim_id == null || block.dimension_ids.indexOf(dim_id) != -1)){
      var new_min = block.records.reduce(function(min, record, index, array){
        if (emo_id == record.emotion_id || emo_id == null){
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

EmoDetails.prototype.checkOptions = function(options = {}) {
  var valid_blocks = this.blocks;

  /* option filter */
  if (options.span && options.span.start && options.span.end) {
    valid_blocks = valid_blocks.filter(function(block, index) {
      if (options.span.start < block.started_at && block.started_at < options.span.end) return true;
    });
  }

  if (options.dim_stores && options.dim_stores.length > 0) {
    valid_blocks = valid_blocks.filter(function(block, index) {
      return options.dim_stores.some(function(dim_store, index) {
        return (block.dimension_ids.indexOf(dim_store.value_id) >= 0);
      });
    });
  }

  return valid_blocks;
}

EmoDetails.prototype.getBlocksAve = function(emo_id = null, options = {}) {
  return this.checkOptions(options).sort(function(a,b){
    return (a.started_at > b.started_at) ? -1 : 1;
  }).map(function(block) {
    return block.getAve(emo_id);
  });
}

EmoDetails.prototype.getBlocksDate = function(options = {}) {
  return this.checkOptions(options).sort(function(a,b){
    return (a.started_at > b.started_at) ? -1 : 1;
  }).map(function(block) {
    return block.started_at.default();
  });
}

EmoDetails.prototype.findBlock = function(block_id) {
  return this.blocks.filter(function(block) {
    return block.id == block_id
  }).first();
}



// ------------------------------------------------------------
// EmoBlock prototype
// ------------------------------------------------------------

EmoBlock.prototype.getAve = function(emo_id = null) {
  var filtered = this.filterEmotion(emo_id);
  return filtered.reduce(function(sum, record) {
      return sum + record.value;
  }, 0) / filtered.length;
}

EmoBlock.prototype.getValues = function(emo_id = null) {
  var filtered = this.filterEmotion(emo_id);
  return filtered.map(function(record) {
      return record.value;
  });
}

EmoBlock.prototype.filterEmotion = function(emo_id = null) {
  return this.records.filter(function(record, index) {
    if (emo_id == record.emotion_id || emo_id == null) return true;
  });
}

EmoBlock.prototype.dataTypedByRecord = function(option) {
  var filtered = this.records;

  if (option.labeling == "emotion" && option.type == "all") {}

  if (option.emotion && option.emotion.id) {
    filtered = this.filterEmotion(option.emotion.id);
  }

  var records = filtered.map(function(record) {
    return record.value;
  });
  
}


// ------------------------------------------------------------
// EmoRecord prototype
// ------------------------------------------------------------
