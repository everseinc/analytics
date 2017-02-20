var ctx = document.getElementById("report_main_graph");
ctx.height = 100;
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ["2/17", "2/18", "2/19", "2/20"],
        datasets: [{
            label: '感情1の推移',
            data: [12, 19, 3, 5, 2, 3],
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
        legend: {
          labels: {
            boxWidth: 40
          }
        }
    }
});