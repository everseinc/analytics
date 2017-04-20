function chartRenderer(canvas) {
  if (!(this instanceof chartRenderer)) {
    return new chartRenderer(canvas);
  }

  this.canvas = canvas;
  this.chart = null;
  this.chart_data = new chartData(this);

  this.labels = [];
  this.datasets = [];

  this.type = "line";
  this.option = {
    scales: {
      yAxes: [{
        ticks: {
          max: 100,
          beginAtZero: true
        },
        gridLines: {
          color: "rgba(0, 0, 0, 0.05)",
        }
      }],
      xAxes: [{
        ticks: {
          callback: function(value) {return ((value % 10) == 0)? value : ''},
        },
        gridLines: {
          color: "rgba(0, 0, 0, 0)",
        }
      }]
    },
    responsive: true,
    legend: {
      labels: {
        boxWidth: 40
      }
    },
    animation: false,
    multiTooltipTemplate: "hihihi",
  };
}



/**
 * reload Chart
 */
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



/**
 * set data from chartData based on chartFormatter
 */
chartRenderer.prototype.setData = function() {
  this.chart_data.deleteData();
  this.chart_data.fetchData();

  var _data = chartFormatter().setLabels(this.chart_data.labels);
  this.chart_data.getData().map(function(base_data, i) {
    var data = chartDataFormatter().
      setLabel(base_data.label).
      setData(base_data.data).
      setColor(base_data.color).
      setBackgroundColor(base_data.backgroundColor);

    _data.appendDatasets(data);
  });

  this.labels = _data.labels;
  this.datasets = _data.datasets;

  return this;
}



/**
 * set emotion_id to Filter through chartData
 * @param {Int} emotion_id [description]
 */
chartRenderer.prototype.setEmotion = function(emotion_id) {
  this.chart_data.setEmotion(emotion_id);

  return this;
}



/**
 * set span to Filter through chartData
 * @param {Date} start [description]
 * @param {Date} end   [description]
 */
chartRenderer.prototype.setSpan = function(start, end) {
  this.chart_data.setSpan(start, end);

  return this;
}



