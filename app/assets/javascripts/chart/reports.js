var ctx = document.getElementById("report_main_graph");
// ctx.clientHeight = 100;
var report_main_graph = document.getElementById("report_json_data");
report_json = report_json_data.getAttribute('data-json')
console.log(report_json)
var myChart = new Chart(ctx, {
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