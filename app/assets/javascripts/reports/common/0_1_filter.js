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
	this.emotion = filterStore.emotion;
	this.span = filterStore.span;

	return this;
}



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
	if (this.from.name == "record" && this.from.block_id) {
		return this._getRecord();
	}
	if (this.from.name == "block" && this.base.name == "emotion") {
		return this._getBlockByEmotion();
	}
	if (this.from.name == "block" && this.base.name == "dim_store") {
		return this._getBlockByDimStore();
	}
}



/* ■■■■■■■■■■■ private methods ■■■■■■■■■■■ */


/**
 * get record based by block
 * @return {[type]} [description]
 */
Filter.prototype._getRecord = function() {
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

