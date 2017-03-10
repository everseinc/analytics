function DimStores(dim_stores) {
  this.dim_stores = dim_stores.map(function(dim_store) {
    return new DimStore(dim_store);
  });
}

function DimStore(dim_store) {
	var self = this;
	this.id = dim_store.id;
	this.key = dim_store.key;
	this.dimensions = dim_store.names.map(function(dimension) {
    return new Dimension(dimension, self);
  });
}

DimStore.prototype.allDimensions = function() {
	return this.dimensions.map(function(dimension) {
		dimension.name;
	});
}

DimStore.prototype.allEmoBlocks = function(emo_details) {
	var hash = {};
	this.dimensions.forEach(function(dimension) {
		hash[dimension.id] = dimension.allEmoBlocks(emo_details);
	});
	return hash;
}