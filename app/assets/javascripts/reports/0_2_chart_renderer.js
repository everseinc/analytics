function chartRenderer(report) {
  this.canvas = document.getElementById("report_main_graph");
  this.type = "line";
  this.labels = report.emo_details.getBlocksDate();
  this.datasets = [{
    label: '感情1の推移',
    data: report.emo_details.getBlocksAve(),
    borderColor: [
        'rgba(255,99,132,1)',
    ],
    fill: false,
    borderWidth: 1
  }];
  this.option = {
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero:true
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
  var render = new Chart(this.canvas, {
    type: this.type,
    data: {
      labels: this.labels,
      datasets: this.datasets
    },
    options: this.option
  });
}