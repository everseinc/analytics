
var report_main_graph = document.getElementById("report_main_graph");
var emo_details_data = JSON.parse(report_json_data.getAttribute('data-json'));
console.log(emo_details_data);
var datasets = [];
var dimensions = Object.keys(emo_details_data.emo_details);
for (dimension in dimensions) {
  var dataset = {};
  var emo_details = emo_details_data.emo_details[dimension];



}
var myChart = new Chart(report_main_graph , {
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