// ------------------------------------------------------------
// chartFormatter
// ------------------------------------------------------------

function chartFormatter() {
	if (!(this instanceof chartFormatter)) {
		return new chartFormatter();
	}

	this.labels = [];
	this.datasets = [{
		label: null,
		data: [],
		color: null,
		backgroundColor: null
	}];
	this.datasets = [];
}

chartFormatter.prototype.setLabels = function(labels) {
	if (!(labels instanceof Array)) { throw new Error("chartFormatter.setLabels() : labels must be Array") }

	this.labels = labels;
	return this;
}

chartFormatter.prototype.appendDatasets = function(dataset) {
	if (!(dataset instanceof Object)) { throw new Error("chartFormatter.appendDatasets() : dataset must be Object") }
	if (!dataset.label) { throw new Error("chartFormatter.appendDatasets() : dataset.label must defined") }
	if (!dataset.data) { throw new Error("chartFormatter.appendDatasets() : dataset.data must defined") }
	if (!dataset.color) { throw new Error("chartFormatter.appendDatasets() : dataset.color must defined") }
	if (!dataset.backgroundColor) { throw new Error("chartFormatter.appendDatasets() : dataset.backgroundColor must defined") }
	if (!(dataset.data instanceof Array)) { throw new Error("chartFormatter.appendDatasets() : dataset.data must Array") }
	if (dataset.data.length <= 0) { throw new Error("chartFormatter.appendDatasets() : dataset.data has no value") }

	this.datasets.push(dataset);
	return this;
}

chartFormatter.prototype.format = function() {
	return {
		labels: this.labels,
		datasets: this.datasets
	}
}





// ------------------------------------------------------------
// chartDataFormatter
// ------------------------------------------------------------


function chartDataFormatter() {
	if (!(this instanceof chartDataFormatter)) {
		return new chartDataFormatter();
	}

	this.label = null;
	this.data = [];
	this.color = null;
	this.backgroundColor = null;
}

chartDataFormatter.prototype.setLabel = function(label) {
	this.label = label;
	return this;
}

chartDataFormatter.prototype.setData = function(data) {
	if (!(data instanceof Array)) { throw new Error("chartDataFormatter.setData() : data must be Array") }

	this.data = data;
	return this;
}

chartDataFormatter.prototype.setColor = function(color) {
	this.color = color;
	return this;
}

chartDataFormatter.prototype.setBackgroundColor = function(backgroundColor) {
	this.backgroundColor = backgroundColor;
	return this;
}

chartDataFormatter.prototype.format = function() {
	return {
		label: this.label,
		data: this.data,
		color: this.color,
		backgroundColor: this.backgroundColor
	}
}



