//Vlocity - Kirk Leibert - 5/10/19
vlocity.cardframework.registerModule.controller('containerChartController', ['$scope', function($scope) {
    console.log("containerChartController creation");

    $scope.drawChart = function drawChart(content) {
        console.log("drawchart");
        console.log(content);
        
        var backgroundColors = ['rgba(128, 0, 0, 0.2)',
                                'rgba(0, 0, 255, 0.2)',
                                'rgba(0, 255, 0, 0.2)',
                                'rgba(51, 53, 56, 0.2'];

        window.chartColors = {
	    red: 'rgb(255, 99, 132)',
	    orange: 'rgb(255, 159, 64)',
	    yellow: 'rgb(255, 205, 86)',
	    green: 'rgb(75, 192, 192)',
	    blue: 'rgb(54, 162, 235)',
	    purple: 'rgb(153, 102, 255)',
	    grey: 'rgb(201, 203, 207)'
        };

        var statementDataArray = content.vlcSI[content.itemsKey];
        var color = Chart.helpers.color;
        var barChartData= {};   
        var barChartData = {
                    labels: [],
                    datasets: [{
                        label: "Amount",
                        backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
                        borderColor: window.chartColors.blue,
                        borderWidth: 1,
                        data: []
                    }]
                };  

            for (var j = 0; j < statementDataArray.length; j++) {
                if (statementDataArray[j].vlcSelected) {            
                     barChartData.labels.push(statementDataArray[j].Name);
                     barChartData.datasets[0].data.push(statementDataArray[j].BalanceDue);
                }
            }

        console.log(barChartData);

		if (Chart !== undefined) {

            var myChart = new Chart('theChart', {
        				type: 'bar',
        				data: barChartData,
        				options: {
        					title: {
        						display: true,
        						text: 'Usage by Month and statement'
        					},
        					tooltips: {
        						mode: 'index',
        						intersect: false
        					},
        					responsive: true,
        					scales: {
        						xAxes: [{
        							stacked: true,
        						}],
        						yAxes: [{
        							stacked: true
        						}]
        					}
        				} 
        			});
            console.log("var myChart = new Chart(theChart");
		}
    }

}]);