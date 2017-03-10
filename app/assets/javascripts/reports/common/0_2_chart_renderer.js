function chartRenderer(report, canvas) {
  this.report = report;
  this.canvas = canvas;
  this.chart = null;
  this.type = "line";
  this.emotions = report.emotions.emotions;
  this.options = {
    span: {},
    dimension: {},
  }
  this.labels = report.emo_details.getBlocksDate();
  this.datasets = report.emotions.emotions.map(function(emotion) {
    return {
      label: emotion.name,
      data: report.emo_details.getBlocksAve(emotion.id),
      borderColor: emotion.color,
      backgroundColor: emotion.backgroundColor,
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

chartRenderer.prototype.getData = function() {
  var self = this;
  this.labels = this.report.emo_details.getBlocksDate(this.options);
  this.datasets = this.emotions.map(function(emotion) {
    return {
      label: emotion.name,
      data: self.report.emo_details.getBlocksAve(emotion.id, self.options),
      borderColor: emotion.color,
      backgroundColor: emotion.backgroundColor,
      lineTension: 0,
      fill: false,
      borderWidth: 1
    };
  });
}

chartRenderer.prototype.setEmotions = function(names) {
  this.emotions = this.report.emotions.getEmotinosByName(names);
  this.getData();
}

chartRenderer.prototype.setSpan = function(start, end) {
  this.options.span = {
    start: start,
    end: end
  }
  this.getData();
}