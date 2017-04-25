function Dimension(dimension, key) {

	if (!(this instanceof Dimension)) {
		return new _Dimension();
	}

  this.id = dimension.id;
  this.name = dimension.name;
  this.key = key;
}

Dimension.prototype.allEmoBlocks = function() {
	var self = this;
	return report.emo_details.blocks.filter(function(emo_block) {
		return emo_block.dimension_ids.indexOf(self.id) >= 0;
	});
}


Dimension.prototype.color = function() {
	return Color().setColor("priority", this.id).color.toCSSValueRGBA();
}

Dimension.prototype.backgroundColor = function() {
	return Color().setColor("priority", this.id).lighten(0x88).color.toCSSValueRGBA();
}


function _Dimension() {}

_Dimension.prototype.getDimensionsFromIds = function(ids) {
	return report.dim_stores.allDimensions().filter(function(dimension) {
		return ids.indexOf(dimension.id) >= 0;
	});
}