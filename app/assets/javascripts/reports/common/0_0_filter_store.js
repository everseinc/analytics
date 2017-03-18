var filterStoreFrom = {
	RECORD: "record",
	BLOCK: "block",
}

var filterStoreBase = {
	EMOTION: "emotion",
	DIMSTORE: "dim_store",
}

var filterStore = {
	from: {
		name: filterStoreFrom.RECORD,
		block_id: null
	},
	base: {
		name: filterStoreBase.EMOTION,
		dim_store_id: null,
		valid_emotions: [],
	},
	dimensions: [],
	span: {
		start: null,
		end: null,
	}
}



/**
 * for setting function
 */
filterStore.setters = {
	base: {}
};



/**
 * filter setting for time page
 * @param  {Array} valid_emotions [description]
 */
filterStore.setters.time = function(valid_emotions) {
	filterStore.from.name = filterStoreFrom.BLOCK;
	filterStore.base.name = filterStoreBase.EMOTION;
	filterStore.base.valid_emotions = valid_emotions;
}



/**
 * filter setting for key page
 * @param  {Int} id [description]
 */
filterStore.setters.key = function(id) {
	filterStore.from.name = filterStoreFrom.RECORD;
	filterStore.from.block_id = id
	filterStore.base.name = filterStoreBase.EMOTION;
}



/**
 * filter setting for dimension page
 * @param  {Int} id [description]
 */
filterStore.setters.dim_store = function(id) {
	filterStore.from.name = filterStoreFrom.BLOCK;
	filterStore.base.name = filterStoreBase.DIMSTORE;
	filterStore.base.dim_store_id = id;
}



/**
 * set base.valid_emotions
 * @param  {Array}    valid_emotions [description]
 * @param  {Function} callback       [description]
 */
filterStore.setters.base.valid_emotions = function(valid_emotions, callback) {
	filterStore.base.valid_emotions = valid_emotions;

	callback();
}



/**
 * set span
 * @param  {Date}     start    [description]
 * @param  {Date}     end      [description]
 * @param  {Function} callback [description]
 */
filterStore.setters.span = function(start, end, callback) {
	filterStore.span.start = start;
	filterStore.span.end = end;

	callback();
}




