function chartRenderer(report) {
  this.canvas = document.getElementById("report_main_graph");
  this.type = "line";
  this.labels = report.emo_details.getBlocksDate();
  this.datasets = report.emotions.emotions.map(function(emotion) {
    return {
      label: emotion.name,
      data: report.emo_details.getBlocksAve(emotion.id),
      borderColor: emotion.color,
      backgroundColor: emotion.backgroundColor,
      fill: false,
      borderWidth: 1
    };
  });
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
  return new Chart(this.canvas, {
    type: this.type,
    data: {
      labels: this.labels,
      datasets: this.datasets
    },
    options: this.option
  });
}