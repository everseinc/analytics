function chartRenderer(report) {
  this.report = report;
  this.canvas = document.getElementById("report_main_graph");
  this.chart = null;
  this.type = "line";
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

chartRenderer.prototype.setSpan = function(options) {
  this.labels = report.emo_details.getBlocksDate(options);
  this.datasets = this.report.emotions.emotions.map(function(emotion) {
    return {
      label: emotion.name,
      data: this.report.emo_details.getBlocksAve(emotion.id, options),
      borderColor: emotion.color,
      backgroundColor: emotion.backgroundColor,
      lineTension: 0,
      fill: false,
      borderWidth: 1
    };
  });
}