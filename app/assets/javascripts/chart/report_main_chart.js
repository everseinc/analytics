(function () {
  var report_main_graph = document.getElementById("report_main_graph");
  var emo_details_data = getJsonFromServer("data-json", "report_json_data");
  console.log(emo_details_data);

  var report_main_chart = new Chart(report_main_graph , {
      type: 'line',
      data: {
          labels: ["2/17", "2/18", "2/19", "2/20"],
          datasets: [{
              label: '感情1の推移',
              data: [12, 19, 3, 5],
              borderColor: [
                  'rgba(255,99,132,1)',
              ],
              fill: false,
              borderWidth: 1
          }]
      },

      options: {
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
      }
  });
}());
