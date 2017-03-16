// ------------------------------------------------------------
// chartRenderer
// ------------------------------------------------------------

function chartRenderer(report, canvas) {
  this.report = report;
  this.canvas = canvas;
  this.chart = null;
  this.type = "line";
  this.emotions = report.emotions.emotions;
  this.dim_store = report.dim_stores.dim_stores[0];
  this.options = {
    span: {},
    dim_stores: [],
  }
  this.labels = report.emo_details.getBlocksDate();
  this.datasets = report.emotions.emotions.map(function(emotion) {
    return {
      label: emotion.name,
      data: report.emo_details.getBlocksAve(emotion.id),
      borderColor: emotion.color(),
      backgroundColor: emotion.backgroundColor(),
      lineTension: 0,
      fill: false,
      borderWidth: 1
    };
  });
  this.option = {
    scales: {
      yAxes: [{
        ticks: {
          max: 100,
          beginAtZero: true
        }
      }]
    },
    responsive: false,
    legend: {
      labels: {
        boxWidth: 40
      }
    }
  };
}



/* ■■■■■■■■■■■ reload ■■■■■■■■■■■ */

chartRenderer.prototype.reload = function() {
  if (this.chart) this.chart.destroy();
  this.canvas.height = 400;
  this.canvas.width = 1000;
  this.chart = new Chart(this.canvas, {
    type: this.type,
    data: {
      labels: this.labels,
      datasets: this.datasets
    },
    options: this.option
  });
}



/* ■■■■■■■■■■■ setters with callbacks ■■■■■■■■■■■ */

chartRenderer.prototype.setEmotions = function(names) {
  this.emotions = this.report.emotions.getEmotionsByName(names);
  this.setDefaultData();
}

chartRenderer.prototype.setSpan = function(start, end) {
  this.options.span = {
    start: start,
    end: end
  }
  this.setDefaultData();
}

chartRenderer.prototype.setDimStore = function(key, value, value_id) {
  this.options.dim_stores.push({
    key: key,
    value: value,
    value_id: value_id,
  });
  this.setDefaultData();
}



/* ■■■■■■■■■■■ base data setter ■■■■■■■■■■■ */

chartRenderer.prototype.setData = function(_data) {
  this.labels = _data.labels;
  this.datasets = _data.datasets.map(function(dataset) {
    return {
      label: dataset.label,
      data: dataset.data,
      borderColor: dataset.color,
      backgroundColor: dataset.backgroundColor,
      lineTension: 0,
      fill: false,
      borderWidth: 1,
    };
  });
}



/* ■■■■■■■■■■■ each setters ■■■■■■■■■■■ */

chartRenderer.prototype.setDefaultData = function() {
  var self = this;
  var labels = this.report.emo_details.getBlocksDate(this.options);
  var _data = chartFormatter().setLabels(labels)

  this.emotions.map(function(emotion) {
    var records = self.report.emo_details.getBlocksAve(emotion.id, self.options);

    var data = chartDataFormatter().
      setLabel(emotion.name).
      setData(records).
      setColor(emotion.color()).
      setBackgroundColor(emotion.backgroundColor());

    _data.appendDatasets(data);
  });

  this.setData(_data);
}

chartRenderer.prototype.getDataFromDimension = function(emotion) {
  var self = this;
  this.options.dim_stores = [{
    key: self.dim_store.key,
    value_id: self.dim_store.names[0].id,
    value: self.dim_store.names[0].name,
  }];
  this.labels = this.report.emo_details.getBlocksDate(this.options);
  this.datasets = this.dim_store.names.map(function(dimension) {
    self.options.dim_stores = [{
      key: self.dim_store.key,
      value_id: dimension.id,
      value: dimension.name,
    }]
    return {
      label: dimension.name,
      data: self.report.emo_details.getBlocksAve(emotion.id, self.options),
      borderColor: dimension.color(),
      backgroundColor: dimension.backgroundColor(),
      lineTension: 0,
      fill: false,
      borderWidth: 1,
    };
  });
}

chartRenderer.prototype.setRecordData = function(block_id) {
  var block = this.report.emo_details.findBlock(block_id);
  var labels = block.getValues(this.emotions.first().id).map(function(v, i) {
    return i;
  });
  labels[0] = block.started_at.default();
  labels[labels.length - 1] = block.ended_at.default();

  var _data = chartFormatter().setLabels(labels)

  this.emotions.map(function(emotion) {
    var records = block.getValues(emotion.id);

    var data = chartDataFormatter().
      setLabel(emotion.name).
      setData(records).
      setColor(emotion.color()).
      setBackgroundColor(emotion.backgroundColor());

    _data.appendDatasets(data);
  });

  this.setData(_data);
}