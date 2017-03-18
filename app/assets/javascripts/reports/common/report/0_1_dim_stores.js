function DimStores(dim_stores) {
  this.dim_stores = dim_stores.map(function(dim_store) {
    return new DimStore(dim_store);
  });
}

DimStores.prototype.findDimStore = function(dim_store_id) {
  return this.dim_stores.filter(function(dim_store) {
    return dim_store.id == dim_store_id
  }).first();
}


function DimStore(dim_store) {
	this.id = dim_store.id;
	this.key = dim_store.key;
	this.names = dim_store.names.map(function(dimension) {
    return new Dimension(dimension, this);
  }.bind(this));
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