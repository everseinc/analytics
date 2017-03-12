function Dimension (dimension, key){
  this.id = dimension.id;
  this.name = dimension.name;
  this.key = key;
}

Dimension.prototype.allEmoBlocks = function(emo_details) {
	var self = this;
	return emo_details.blocks.filter(function(emo_block) {
		return emo_block.dimension_ids.indexOf(self.id) >= 0;
	});
}


Dimension.prototype.color = function() {
	return Color().setColor("priority", this.id).color.toCSSValueRGBA();
}

Dimension.prototype.backgroundColor = function() {
	return Color().setColor("priority", this.id).lighten(0x88).color.toCSSValueRGBA();
}