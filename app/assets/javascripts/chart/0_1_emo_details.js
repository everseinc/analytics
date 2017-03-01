function emoDetails(details) {
  this.blocks = details.emo_details.map(function(block) {
    return new emoBlock(block);
  })
}

function emoBlock(block) {
	this.started_at = block.started_at;
	this.ended_at = block.ended_at;
	this.records = block.records.map(function(record) {
		return new emoRecord(record);
	});
}

function emoRecord(record) {
  this.value = record.value;
  this.dimension_id = record.dimension_id;
  this.emotion_id = record.emotion_id;
}