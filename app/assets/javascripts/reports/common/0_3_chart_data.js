function chartData(parent) {
	this.parent = parent;
	this.filter = Filter().setFilter();

	this._labels = [];
	this.labels = null;
	this.datasets = [];
	this.label = [];
	this.color = [];
	this.backgroundColor = [];
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
	this._labels.push(_data.labels);
  this.datasets.push(_data.datasets);
 	this.label.push(_data.label);
 	this.color.push(_data.color);
	this.backgroundColor.push(_data.backgroundColor);
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
  
  this.labels = (this.labels.length < 15) ? this.labels : this.labels.map(function(label, index) {
  	return (index % 10 == 0) ? label : ""
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
}



/**
 * set emotion id to filter
 * @param int emotion_id
 */
chartData.prototype.setEmotion = function(emotion_id) {
	this.filter.emotion.id = emotion_id;
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


