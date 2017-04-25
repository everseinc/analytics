function Filter() {
	if (!(this instanceof Filter)) {
		return new Filter();
	}

	this.from = {
		name: null,
		block_id: null,
	};
	this.base = {
		name: null,
		dim_store_id: null,
		valid_emotions: [],
	};
	this.dim_store = {
		id: null,
	}
	this.dimensions = [{
		id: null,
	}];
	this.emotion = {
		id: null,
	}
	this.span = {
		start: null,
		end: null
	}
}



/**
 * set filter to this property
 */
Filter.prototype.setFilter = function() {
	this.from = filterStore.from;
	this.base = filterStore.base;
	this.dimensions = filterStore.dimensions;
	this.span = filterStore.span;

	return this;
}



/**
 * get search option
 * @return {Object} [description]
 */
Filter.prototype.searchOption = function() {
	return {
		dimensions: this.dimensions,
		span: this.span
	}
}



/**
 * get data
 * @return {} records or blocks
 */
Filter.prototype.get = function() {
	if (!this.from) { throw new Error("Filter.get() : this.from must be defined"); }
	if (this.from.name == "record" && this.base.name == "single") {
		return this._getRecord();
	}
	if (this.from.name == "record" && this.base.name == "emotion") {
		return this._getRecordByEmotion();
	}
	if (this.from.name == "block" && this.base.name == "emotion") {
		return this._getBlockByEmotion();
	}
	if (this.from.name == "block" && this.base.name == "emotion") {
		return this._getBlockByEmotion();
	}
	if (this.from.name == "block" && this.base.name == "dim_store") {
		return this._getBlockByDimStore();
	}
	if (this.from.name == "dimension" && this.base.name == "single") {
		return this._getDimension();
	}
}





/* ■■■■■■■■■■■ private methods ■■■■■■■■■■■ */



/**
 * get record of blocks
 * @return {[type]} [description]
 */
Filter.prototype._getRecord = function() {
	var emotion = report.emotions.getEmotionById(this.emotion.id);
	var blocks = this.from.block_ids.map(function(block_id) {
		return report.emo_details.findBlock(block_id);
	});

	return blocks.map(function(block) {
		return {
			labels: block.getValues(emotion.id).map(function(v, i) {
	    	return i;
		  }),
		  datasets: block.getValues(emotion.id),
		  label: block.key,
		  color: block.color(),
		  backgroundColor: block.backgroundColor()
		}
	});
}



/**
 * get record based by emotion
 * @return {[type]} [description]
 */
Filter.prototype._getRecordByEmotion = function() {
	var block = report.emo_details.findBlock(this.from.block_id);

	return report.emotions.emotions.map(function(emotion) {
		return {
			labels: block.getValues(emotion.id).map(function(v, i) {
		    return i;
		  }),
		  datasets: block.getValues(emotion.id),
		  label: emotion.name,
		  color: emotion.color(),
		  backgroundColor: emotion.backgroundColor()
		}
	});
}



/**
 * get block based by emotion
 * @return {[type]} [description]
 */
Filter.prototype._getBlockByEmotion = function() {
	return report.emotions.getEmotionsByName(this.base.valid_emotions).map(function(emotion) {
		return {
			labels: report.emo_details.getBlocksDate(this.searchOption()),
			datasets: report.emo_details.getBlocksAve(emotion.id, this.searchOption()),
			label: emotion.name,
		  color: emotion.color(),
		  backgroundColor: emotion.backgroundColor()
		}
	}.bind(this));
}



/**
 * get block based by dim_store
 * @return {[type]} [description]
 */
Filter.prototype._getBlockByDimStore = function() {
	var dim_store = report.dim_stores.findDimStore(this.base.dim_store_id);

	return dim_store.names.map(function(dimension) {
		this.dimensions.push({id: dimension.id});
		var res = {
			labels: report.emo_details.getBlocksDate(this.searchOption()),
		  datasets: report.emo_details.getBlocksAve(this.emotion.id, this.searchOption()),
		  label: dimension.name,
		  color: dimension.color(),
		  backgroundColor: dimension.backgroundColor()
		}
		this.dimensions.pop();
		return res;
	}.bind(this));
}



Filter.prototype._getDimension = function() {
	var dim_store = report.dim_stores.findDimStore(this.dim_store.id);

	return [{
		labels: dim_store.names.map(function(dimension) {
			return dimension.name;
		}),
		datasets: dim_store.names.map(function(dimension) {
			return dimension.allEmoBlocks().length;
		}),
		label: dim_store.key,
		color: dim_store.names.map(function(dimension) {
			return dimension.color();
		}),
		backgroundColor: dim_store.names.map(function(dimension) {
			return dimension.color();
		}),
	}];
}





