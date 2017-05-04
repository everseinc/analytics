function chartData(parent) {
	this.parent = parent;
	this.filter = Filter().setFilter();

	this._labels = [];
	this.labels = null;
	this._datasets = [];
	this.datasets = [];
	this._label = [];
	this.label = [];
	this.color = [];
	this.backgroundColor = [];

	this.after_actions = []
}



/**
 * reload ChartRender
 */
chartData.prototype.reload = function() {
	this.parent.reload();
}



/**
 * update ChartRenderer
 * @param  {} _data
 */
chartData.prototype.updateData = function(_data) {
	this.labels = _data.labels;
	this.datasets = _data.datasets;
	this.label = _data.label;
  this.color = _data.color;
	this.backgroundColor = _data.backgroundColor;

	this.reload();
}



/**
 * push data to this property
 * @param  {} _data
 */
chartData.prototype.pushData = function(_data) {
	if (_data.labels)          this._labels.push(_data.labels);
  if (_data.datasets)        this.datasets.push(_data.datasets);
 	if (_data.label)           this.label.push(_data.label);
 	if (_data.color)           this.color.push(_data.color);
	if (_data.backgroundColor) this.backgroundColor.push(_data.backgroundColor);
}



/**
 * delete all data
 */
chartData.prototype.deleteData = function() {
	this._labels = [];
	this.labels = null;
	this.datasets = [];
	this.label = [];
	this.color = [];
	this.backgroundColor = [];
}



/**
 * get array data
 * @return Array
 */
chartData.prototype.getData = function() {
	return this.datasets.map(function(v, i) {
		return {
			label: this.label[i],
			data: this.datasets[i],
			color: this.color[i],
			backgroundColor: this.backgroundColor[i]
		}
	}.bind(this));
}



/**
 * create labels from _labels
 */
chartData.prototype.createLabels = function() {
	this.labels = (this._labels.length == 0) ? [] : this._labels.reduce(function(x, y) {
    return (x.length > y.length) ? x : y;
  });
}



/**
 * fetch data through Filter
 */
chartData.prototype.fetchData = function() {
	_all_data = this.filter.get();
	_all_data.map(function(_data) {
		this.pushData(_data);
	}.bind(this));
	this.createLabels();

	this.runAfterActions();
}


chartData.prototype.runAfterActions = function() {
	this.after_actions.map(function(action) {
		action();
	});
}



/**
 * set emotion id to filter
 * @param {Int} emotion_id
 */
chartData.prototype.setEmotion = function(emotion_id) {
	this.filter.emotion.id = emotion_id;
}



/**
 * set dim_store_id to filter
 * @param {Int} dim_store_id [description]
 */
chartData.prototype.setDimStore = function(dim_store_id) {
	this.filter.dim_store.id = dim_store_id;
}



/**
 * set block_id to filter
 * @param {Int} block_id [description]
 */
chartData.prototype.setBlock = function(block_id) {
	this.filter.block.id = block_id;
}



/**
 * set span to filter
 * @param Date start
 * @param Date end
 */
chartData.prototype.setSpan = function(start, end) {
	this.filter.span = {
		start: start,
		end: end
	};
}



chartData.prototype.histogram = function() {
	this.after_actions.push(this.createHistogram.bind(this));
}


/**
 * [createHistogram description]
 */
chartData.prototype.createHistogram = function() {
	this._datasets = this.datasets;

	this.datasets = [Array(100).fill(0)];
	this._datasets[0].map(function(data) {
		this.datasets[0][data] += 1;
	}.bind(this));

	this.labels = [...Array(100).keys()];
}



